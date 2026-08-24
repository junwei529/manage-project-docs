from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path
from urllib.parse import unquote


ROOT = Path(__file__).resolve().parents[1]
PRODUCT = 'manage-project-docs'
BASELINE = '80910a8b2375a11be897e9660c4b00a06d00dd13'
EXPECTED_PACKAGE_COUNT = 6
EXPECTED_CASES = set(['project-docs-adopt.md', 'project-docs-conflict.md', 'project-docs-continuity.md', 'project-docs-mature-noop.md', 'project-docs-safety-boundaries.md'])
EXPECTED_FIXTURES = set(['project-docs-adopt', 'project-docs-conflict', 'project-docs-continuity', 'project-docs-mature-noop', 'project-docs-safety-boundaries'])
EXCLUDED_PARTS = {
    ".git",
    ".eval-runs",
    "__pycache__",
    ".pytest_cache",
    ".codegraph",
    ".code-review-graph",
}
LINK_PATTERN = re.compile(r"!?\[[^\]]*]\(([^)\n]+)\)")
PRIVATE_PATTERNS = {
    "private source or destination path": re.compile(r"(?i)(?:D:[\\/]GitLib[\\/]|\.codex[\\/]worktrees[\\/])"),
    "private Codex data path": re.compile(r"(?i)\.codex[\\/](?:memories|rollouts|sessions)"),
    "UUID-like task identifier": re.compile(r"\b[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\b", re.I),
    "secret-like token": re.compile(r"(?i)\b(?:gh[pousr]_[A-Za-z0-9]{20,}|sk-(?:proj-)?[A-Za-z0-9_-]{16,})"),
    "private key": re.compile(r"-----BEGIN [A-Z ]*PRIVATE KEY-----"),
}


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def blob_sha1(data: bytes) -> str:
    header = f"blob {len(data)}\0".encode("ascii")
    return hashlib.sha1(header + data).hexdigest()


def normalized_sha256(data: bytes) -> str:
    text = data.decode("utf-8").replace("\r\n", "\n").replace("\r", "\n")
    return sha256(text.encode("utf-8"))


def files_on_disk() -> set[str]:
    result = set()
    for path in ROOT.rglob("*"):
        if not path.is_file():
            continue
        relative = path.relative_to(ROOT)
        if any(part in EXCLUDED_PARTS for part in relative.parts):
            continue
        result.add(relative.as_posix())
    return result


def check_links(relative: str, text: str, failures: list[str]) -> None:
    if not relative.endswith(".md"):
        return
    path = ROOT / relative
    for match in LINK_PATTERN.finditer(text):
        target = match.group(1).strip()
        if target.startswith("<") and target.endswith(">"):
            target = target[1:-1]
        if not target or target.startswith("#") or re.match(r"^[A-Za-z][A-Za-z0-9+.-]*:", target):
            continue
        target_path = unquote(target.split("#", 1)[0])
        resolved = (path.parent / target_path).resolve()
        try:
            resolved.relative_to(ROOT.resolve())
        except ValueError:
            failures.append(f"{relative}: local link leaves repository: {target_path}")
            continue
        if not resolved.exists():
            failures.append(f"{relative}: missing local link target: {target_path}")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()
    failures: list[str] = []

    manifest_path = ROOT / "provenance" / "source-map.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    if manifest.get("schema") != "standalone-skill-provenance/v1":
        failures.append("provenance manifest schema mismatch")
    if manifest.get("product") != PRODUCT or manifest.get("source_commit") != BASELINE:
        failures.append("provenance product or source commit mismatch")

    entries = manifest.get("entries", [])
    destinations = [entry.get("destination") for entry in entries]
    if len(destinations) != len(set(destinations)):
        failures.append("duplicate provenance destination")
    expected_files = set(destinations) | {"provenance/source-map.json"}
    actual_files = files_on_disk()
    missing = sorted(expected_files - actual_files)
    extra = sorted(actual_files - expected_files)
    if missing:
        failures.append(f"missing mapped files: {missing}")
    if extra:
        failures.append(f"unmapped files: {extra}")

    for entry in entries:
        relative = entry["destination"]
        path = ROOT / relative
        if not path.is_file():
            continue
        raw = path.read_bytes()
        if sha256(raw) != entry.get("target_sha256"):
            failures.append(f"{relative}: target SHA-256 mismatch")
        if entry.get("kind") == "exact-git-blob":
            if blob_sha1(raw) != entry.get("source_blob"):
                failures.append(f"{relative}: source Git blob mismatch")
        elif entry.get("kind") == "standalone-normalized-text-rewrite":
            if normalized_sha256(raw) != entry.get("target_normalized_sha256"):
                failures.append(f"{relative}: normalized-text SHA-256 mismatch")
            if not entry.get("sources"):
                failures.append(f"{relative}: adapted file has no source mapping")
        else:
            failures.append(f"{relative}: unknown provenance kind")

        try:
            text = raw.decode("utf-8")
        except UnicodeDecodeError:
            failures.append(f"{relative}: not valid UTF-8")
            continue
        if raw.startswith(b"\xef\xbb\xbf"):
            failures.append(f"{relative}: UTF-8 BOM is not allowed")
        for number, line in enumerate(text.splitlines(), start=1):
            if line.endswith((" ", "\t")):
                failures.append(f"{relative}:{number}: trailing whitespace")
        check_links(relative, text, failures)
        for label, pattern in PRIVATE_PATTERNS.items():
            if pattern.search(text):
                failures.append(f"{relative}: {label}")

    package_root = ROOT / "skills" / PRODUCT
    package_files = {
        path.relative_to(package_root).as_posix()
        for path in package_root.rglob("*") if path.is_file()
    }
    mapped_package_files = {
        entry["destination"].split(f"skills/{PRODUCT}/", 1)[1]
        for entry in entries if entry["destination"].startswith(f"skills/{PRODUCT}/")
    }
    if package_files != mapped_package_files or len(package_files) != EXPECTED_PACKAGE_COUNT:
        failures.append("package path set or file count mismatch")
    skills = {path.name for path in (ROOT / "skills").iterdir() if path.is_dir()}
    if skills != {PRODUCT}:
        failures.append(f"unexpected Skill roots: {sorted(skills)}")

    cases = {path.name for path in (ROOT / "evals" / "cases").glob("*.md")}
    fixtures = {path.name for path in (ROOT / "evals" / "fixtures").iterdir() if path.is_dir()}
    if cases != EXPECTED_CASES:
        failures.append(f"case set mismatch: {sorted(cases)}")
    if fixtures != EXPECTED_FIXTURES:
        failures.append(f"fixture set mismatch: {sorted(fixtures)}")

    skill_text = (package_root / "SKILL.md").read_text(encoding="utf-8")
    if not re.match(r"\A---\n.*?\n---\n", skill_text, re.S):
        failures.append("SKILL.md frontmatter missing or malformed")
    references = package_root / "references"
    if references.exists():
        for reference in references.iterdir():
            if reference.is_file() and f"](references/{reference.name})" not in skill_text:
                failures.append(f"SKILL.md does not directly link references/{reference.name}")

    result = {
        "product": PRODUCT,
        "source_commit": BASELINE,
        "mapped_files": len(entries),
        "failures": failures,
        "result": "PASS" if not failures else "FAIL",
    }
    if args.json:
        print(json.dumps(result, ensure_ascii=False, sort_keys=True))
    else:
        print(f"{PRODUCT}: {result['result']} ({len(entries)} mapped files)")
        for failure in failures:
            print(f"- {failure}")
    return 0 if not failures else 1


if __name__ == "__main__":
    sys.exit(main())
