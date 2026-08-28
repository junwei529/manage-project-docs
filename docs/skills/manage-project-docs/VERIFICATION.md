# Project Docs Verification

## Accepted migration baseline

- Source commit: `80910a8b2375a11be897e9660c4b00a06d00dd13`
- Package path: `skills/manage-project-docs/`
- Package files: 6
- Provenance manifest: [`../../../provenance/source-map.json`](../../../provenance/source-map.json)

## Repository check

```powershell
python -B scripts/check_repository.py --json
```

This verifies exact Git-blob identity for package/case/fixture/license inputs,
the adapted-file hashes and source mappings, expected package and evaluation
shape, UTF-8/BOM and Markdown-link boundaries, and publication safety.
The default standalone route preserves a checker-pinned source-identity map;
it does not assume the former source repository is present.

When the exact source Git object store is available during migration audit, run:

```powershell
python -B scripts/check_repository.py --json --source-repository <source-git-repository>
```

That explicit route resolves the recorded commit/tree and proves every mapped
source path, Git blob, and raw or normalized SHA-256 directly from Git objects;
it never reads source working-tree bytes.

## Adversarial checker matrix

```powershell
python -B scripts/check_repository.py --adversarial
```

This builds every disposable repository strictly from staged Git-index blobs;
working-tree, ignored, untracked, cache, and link-target bytes are not copied.
The admitted publication-classifier input domain is the UTF-8 text of mapped
repository files plus every string value consumed from the v1 provenance
manifest. Manifest paths remain strict POSIX repository-relative paths. Within
that domain, the locator grammar is limited to direct absolute Windows drive
profiles, direct/device UNC locators, and `file:` URIs that resolve to those
forms after exactly one percent-decoding pass. One separator/prefix
canonicalization handles equivalent slash forms and repeated leading
separators in direct and `file:` representations; explicit non-`file:` URIs,
repository-relative paths, POSIX
`file:` paths, and non-profile Windows roots remain portable. Locator-like
`file:` or UNC forms that cannot be classified unambiguously after that pass
fail closed, including `file:` candidates whose raw query or fragment
delimiter or raw-space token boundary would make the local path representation
ambiguous, and candidates whose percent escapes are not valid UTF-8. Direct UNC
forms with a server but no share also fail closed; the
portable `//` syntax-text partition requires no server token. This policy
protects the existing no-private-locator publication
contract; it does not promise another URI or filesystem grammar.
The finite fail-closed matrix covers drive-rooted private Windows profiles with
backslash, forward-slash, and mixed separators; ASCII-space and Unicode profile
names; end-of-string and deeper paths; and recognized device-drive prefixes.
It also covers ordinary, device, and extended UNC locators after one canonical
separator/prefix normalization. A shared structured UNC parser requires
nonempty server and share components, accepts Unicode and internal spaces, and
rejects controls and Windows-invalid component characters. Portable explicit
non-file URI, relative, embedded-drive, empty-profile, singular-root,
syntax-text, POSIX, and non-profile-root partitions remain accepted. A
URI-aware standard-library layer parses `file:` candidates,
decodes percent escapes once, and routes local-drive, `localhost`, UNC-authority,
drive-authority (including a once-decoded drive-rooted authority remainder),
and encoded device-drive representations through the same path predicates;
HTTP/HTTPS, other schemes, non-profile Windows roots, POSIX paths, bare schemes,
and empty-profile forms remain portable. Git-index snapshots remove inherited
`GIT_*` selectors case-insensitively, reintroduce only disabled optional locks,
and use an explicit repository route; a disposable hostile-selector matrix
proves both `ls-files` and `cat-file` stay bound to the intended repository.
The matrix also covers invalid UTF-8 and unpaired-Unicode-surrogate structured failure, manifest
identity and rewrite-source schema, exact-blob source SHA-256 verification,
top-level source-commit/source-tree identity, and a checker-pinned canonical
digest of every destination-to-source identity mapping. Exact tree membership
is established only by the explicit source-object audit above;
manifest duplicate-key rejection, top-level `manifest_provenance` source-record
schema/path validation, decoded-key/value publication safety, unsafe
destinations, source paths free of Unicode General_Category `Cc` controls
(covering C0, DEL, and C1 while preserving other admitted Unicode categories),
missing mapped content, the legacy
reparse fallback, and rejection of link-like source-repository ancestors. An external-link
sentinel proves that a link entry is rejected before its target blob is read or
copied; the result identifies whether the current host also created a real
disposable symlink or used the deterministic index-link-mode branch.

## Focused check

The repository checker covers the retained deterministic cases and fixtures.

## Evidence limits

The migration alone did not establish fresh native selection, installed-copy
behavior, publication, or broad efficacy. B2 evidence below separately binds
the exact public Release and stable installed copy. Broad efficacy and every
untested context remain `UNKNOWN`.

## Independent release qualification

### Consumed SOURCE behavior evidence

A single bounded qualification used `gpt-5.6-sol` with high reasoning against the exact committed candidate instructions and two tracked case/fixture sets at `6b0bf47fdc10722b830508af9077288601b55ab9`. It ran ephemerally, ignored ambient user configuration and project rules, received the authorized committed inputs inline, invoked no tools, and attempted no mutation.

- `project-docs-conflict` behavior slice: `PASS`. The response preserved competing authority, frozen history, `UNKNOWN` claims, the dirty user-owned source boundary, and the explicit approval gate before any canonical or structural write. Controller-observed exact-candidate selection/load was not exercised and remains `UNKNOWN`.
- `project-docs-mature-noop` behavior slice: `PASS`. The response selected `NOOP`, preserved the compact single-owner layout, avoided a parallel document suite, and did not claim unrun runtime verification. Controller-observed body/reference reads and the four selection-negative contexts were not exercised and remain `UNKNOWN`.

This evidence is consumed and must not be repeated to obtain a preferred answer. It proves only the two bounded SOURCE behavior slices; it does not prove selection/load coverage, negative contexts, installed-copy behavior, publication, or broad efficacy.

### Final local candidate gates

Run these after the tracked diff is frozen:

```powershell
python -B scripts/check_repository.py --json
git diff --check
```

The closeout must also confirm:

- every tracked path remains covered by `provenance/source-map.json`, with matching raw and normalized target hashes;
- the installable package is still exactly the six expected files and is byte-identical to the mapped candidate;
- documentation has no private locator, session, host, secret-like, publication, installed-copy, or efficacy overclaim;
- relative Markdown links resolve, tracked text is UTF-8 without BOM and uses the repository newline policy;
- the ignored `scripts/__pycache__/` state is neither inspected nor used as evidence;
- native Codex review has material whole-diff/source coverage and all P0/P1/P2 findings are resolved before commit;
- candidate C's clean commit and post-commit checker rerun bind the corrected bytes while local `main`, remotes, and tags remain unchanged;
- C remains `PENDING_PLANNER_ACCEPTANCE` until the Planner accepts that exact commit and tree;
- after acceptance, a separately authorized governance writer may create repo-local receipt R, which records C, C's tree, the verdict, and the evidence pointer in `STATE.md`, changes the readiness state from `PENDING_PLANNER_ACCEPTANCE` to `LOCAL_RELEASE_READY`, updates `provenance/source-map.json`, and passes a clean post-commit repository checker;
- R's receipt and readiness transition are explicitly allowed, but R changes no lifecycle instructions, package/evaluation/checker bytes, qualification criteria or meaning, evidence inputs or results, public-release identity, or installed-copy claims; any broader delta stops for a new acceptance disposition;
- future B2 public Release commit P must remain distinct from C and R; neither
  C nor R may be retagged as P.

## B2 public release and installed-copy evidence

### Public Release

- Repository: `https://github.com/junwei529/manage-project-docs`
- Immutable Release commit P and annotated-tag target:
  `02a1494e7dd22f9b598b752057c792aa3b2e3ae2`
- Publication-time remote `main` snapshot: P
  `02a1494e7dd22f9b598b752057c792aa3b2e3ae2`
- Moving default branch: may contain later evidence or correction commits; verify
  its live ref independently.
- P tree: `0b0ed5a8edfef067bb2807bde8e66bc62f8dae4a`
- Package tree: `21971e5d8872c9c131675a926e45fdcfad31d95c`
- Annotated tag: `v0.3.0`; tag object
  `f620a2af6bbef25ca4195cf29953c7a1c0084181`; peeled commit P
- Release:
  `https://github.com/junwei529/manage-project-docs/releases/tag/v0.3.0`
- Release state: public, non-draft, non-prerelease, and `Latest`; title and body
  exactly match the human-approved notes.

The tag remains bound to P. This evidence update occurs after P and does not
move or redefine the release commit.

### Immutable-source lifecycle

The official installer fetched `skills/manage-project-docs` from public ref
`junwei529/manage-project-docs@v0.3.0`. The isolated result was an ordinary
directory with exactly these six SHA-256-bound files:

| Relative file | SHA-256 |
| --- | --- |
| `agents/openai.yaml` | `0801a1829848027fb1c209608ac44ece0b3c0eae6ad7ac42dcc4facb9dd89468` |
| `assets/templates/continuity-anchor.md` | `9b7cc87a002176b604301773db7b91af5ae113805b245dc94ad6481e72bdd603` |
| `assets/templates/project-doc-starter.md` | `d49b567235b29aad84b468e054cea993bebc774094718ce3e9d7d2d30202a4e4` |
| `references/audit-and-adopt.md` | `7a68d650d164f6f97088d8186916278df711e70db74f00117a088d22ce8d7f13` |
| `references/maintain-and-recover.md` | `92768df8aa8d7a8f799366c46b9f03ba6bab8183896d80578188c03e361c9bb4` |
| `SKILL.md` | `a1dad61252625f18ddac743b65257229f8dd26e3a65e32652711e8c62e29a609` |

The pre-existing user installation was an exact six-file match for public
legacy `junwei529/skills@v0.2.0`, with no local delta. Isolated qualification
passed the complete route: exact v0.2.0 live preflight, exact v0.3.0 stage,
same-filesystem quarantine, stage-to-live update, origin-aware live-path
absence, and v0.3.0 restoration. The exact v0.2.0 rollback copy remained
unchanged.

The persistent user installation then passed stage, hash verification, and
same-filesystem atomic switch. Its installed manifest binds repository, tag,
P, package tree, and the six hashes above. The exact v0.2.0 rollback copy,
rollback manifest, and installed manifest are retained outside every Skill
discovery root; no rollback-copy deletion is authorized.

### Fresh-task attribution and behavior

- A cold projectless task discovered and explicitly selected the exact
  `CODEX_HOME user Skill`. Catalog locator, loaded body, six installed hashes,
  and installed manifest agreed. In a frozen four-file conflicting-governance
  fixture it returned `PROPOSE`, kept the competing canonical owner and next
  action `UNKNOWN`, requested the minimum owner/next-action decision, proposed
  no broad file suite, and changed no frozen or installed byte.
- After the exact live user origin was quarantined outside discovery roots, a
  separate cold projectless task proved that target origin was not discovered
  or loaded. Separately checked user, project, admin, and system same-name
  origins were absent. This is origin-aware evidence, not a claim of global
  host-wide absence.
- After same-filesystem restoration, another cold projectless task again bound
  the unique loaded user Skill to the exact six hashes and installed manifest.
  It caused no mutation.

The installed manifest SHA-256 observed before and after the behavior proof was
`5fee9530e02482ff6932bc874d888bd06068d9341bcd739136b47cdf4ec3ab46`.
The persistent lifecycle and loaded-copy evidence is
`QUALIFIED_PENDING_PLANNER_ACCEPTANCE`. Broad efficacy, broader negative-context
coverage, write/adoption behavior, monorepos, generated documentation, external
owners, and other untested contexts remain `UNKNOWN`.
