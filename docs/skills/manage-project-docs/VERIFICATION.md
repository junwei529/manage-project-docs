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

This verifies exact Git-blob identity for retained fixture and license
inputs; mapped source and target hashes for adapted package, case, and
documentation files (including retained helper adaptations); expected package and evaluation shape;
UTF-8/BOM and Markdown-link boundaries; and publication safety.
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

The current candidate is source-only. Its identity and readiness are owned by
[State](STATE.md#current-implementation). The earlier entry-behavior revision
has historical local verification and installed-byte binding as a
`LOCAL_DEVELOPMENT_COPY`; those bytes do not qualify the new candidate.

## Current Source Validation

The existing package and five case groups provide the following review map.
This maps definitions and source semantics, not completed model behavior:

| Contract slice | Source and existing case coverage |
|---|---|
| Content necessity versus separate-file necessity; mature layout | `audit-and-adopt.md`; adopt necessity variant and mature-noop reassessment/simplification variants |
| Mixed sections, same-file duplication, consumer outside the diff | `maintain-and-recover.md`; continuity mixed-content/consumer variant |
| Legitimate historical old values; approved but unimplemented work | Content update modes and starter; continuity mixed-content variant |
| Partial replacement, invalidity, applicability across plans/decisions/results | Content update modes; conflict partial-replacement variant |
| Continuous approval and new effects | Entry workflow, maintenance and pause/handoff rules, continuity anchor; adopt interrupted-work, continuity existing-entry pause/handoff, and safety authorization variants |
| Generated/external/read-only/writer/language/nearest scope | Existing boundaries; safety base and writer-conflict variant |
| Optional intent words and ordinary maintenance | Natural-language entry and YAML default; adopt, mature-noop, continuity, and conflict variants |

Local validation uses `python -B scripts/check_repository.py --json`, the
installed Skill Creator `scripts/quick_validate.py` against
`skills/manage-project-docs`, and `git diff --check`. On a Windows Python whose
default text codec is not UTF-8, use `python -B -X utf8` for the Skill validator;
the candidate stays UTF-8 without BOM. Source semantic inspection
must separately follow the relationships above; hashes, frontmatter, or text
matches cannot establish model adherence or complete consumer coverage.

Local source checks on 2026-09-08:

| Check | Terminal result and limit |
|---|---|
| Repository checker | `PASS`, exit 0, 63 mapped files; source-object membership not requested |
| Skill Creator quick validator | `Skill is valid!`, exit 0 with Python UTF-8 mode; frontmatter/scaffold validation only |
| `git diff --check` | exit 0 |
| Source identity and retained-consumer comparison | `PASS`, exit 0 for the read-only collector; ten exact-to-rewrite conversions preserve original identities, 42 unchanged fixture/consumer files match the entry baseline, and checker AST is identical to HEAD except the mapping pin |

The default-codec validator invocation first failed with `UnicodeDecodeError`
using GBK (exit 1); the command-local UTF-8 rerun passed without changing the
validator or host configuration. A separate oversized inline read-only identity
command failed before process creation with Windows error 206; a shortened
collector completed, and its output was compared to the entry baseline. Neither
failure is a model result or a product-code defect.

Source semantic inspection covered the contract table above and the consumer
map below. Independent source assessment first required correction of the
pause/handoff condition that incorrectly gated maintenance of an existing
recovery entry on new-entry structural authorization. That finding was corrected,
covered by the existing-entry continuity scenario, and closed in the second
assessment. The approved source scope is independently accepted after one
correction round; observed model behavior remains unverified. This source
acceptance establishes neither release readiness nor installation or publication.
The source-assessment stage included no model/API case run or native review.
Its adversarial matrix was deferred because the staged Git index did not yet
contain the candidate. The later local delivery scope authorizes staging and
the commit gate below; it does not retroactively qualify the old index.
Source-object membership audit is separate from the default checker and is not
requested for this source revision.

Documentation impact starts from changed facts: package/case rewrite identity
maps to PROVENANCE and source-map; product behavior maps to DESIGN and the
root/product English and Chinese README consumers; candidate readiness maps to
STATE and this verification entry; case-definition identity also maps to
`evals/README.md`, a consumer outside the initially proposed diff. The
existing AGENTS routing, retained fixtures, and setup/inspection helpers were
checked with no change: existing routes, raw test inputs, and baseline helper
interfaces remain usable. Variant input identity must additionally be recorded
as described in the evaluation index; no fixture/helper execution occurred.
Frozen B2 results, release identities,
and earlier installation hashes remain valid for their historical inputs.

## Local Installation

The accepted source candidate was installed locally on 2026-09-08 as a
`LOCAL_DEVELOPMENT_COPY`. Preflight bound the existing six-file installation
to the earlier entry-presentation checkpoint below. A fresh staging directory
outside Skill discovery roots received the exact accepted package, followed
by a same-filesystem live-to-retained-backup and stage-to-live swap.

The ordinary sandbox postflight read all six live and retained files as UTF-8,
compared raw hashes against source and the old installation respectively, and
confirmed the same owner/security descriptors as the preflighted installation.
No ACL or execution-policy change was needed. All inspected package and path
entries were non-reparse; the private receipt parsed successfully, and no
staging or failed-candidate directory remained. The old package and private
receipt are retained outside discovery roots; no previous evidence was deleted.

| Installed relative file | Observed raw SHA-256 |
|---|---|
| `SKILL.md` | `a9b99317c254773d35dfddd05474ffcc7125b991148f1c3554db8d66a0c91e7e` |
| `agents/openai.yaml` | `66c24267e0c89356c5d197470b324202c5084ceddb73b7ea486c2498ea5cf8b0` |
| `assets/templates/continuity-anchor.md` | `ecd2abd6405133cc91557d75d36cdbec204bc1211edf93fc594a236ec95ccff3` |
| `assets/templates/project-doc-starter.md` | `2f30a5cd2a21c24e5dea4ff0432ac332010669e9df94ef582de9a3f9cd169a3c` |
| `references/audit-and-adopt.md` | `08cd756cd8372f633a5c1e6d9e2a97154004395477ae9b72c119bec2aa9b460d` |
| `references/maintain-and-recover.md` | `42586811d851c8cd27acf33923ba92dac80ccaf09b5f1816bfe7018512b89875` |

The apply command and separate ordinary-sandbox postflight both completed with
exit 0. This proves local bytes and bounded readability/permission continuity,
not actual fresh-task selection/load, model behavior, or public release.

## Local Delivery Gate

The current delivery scope permits staging the approved cumulative diff,
running `python -B scripts/check_repository.py --adversarial` against that bound
index, and a same-session native review before local commit. The six-file
installation remains bound to the table above; any package correction requires
installation rebinding. Native review must cover the final intended diff and
material sources. Source acceptance does not replace that gate, and commit
success does not resolve the pending remote push route.

## Earlier Local Development Installation

After explicit authorization for a local-only update, the existing user copy
was independently preflighted as the exact six-file public `v0.3.0` package,
with no extra file or reparse entry. The then-current entry-presentation package was
copied to fresh staging, verified against its six raw-byte SHA-256 values, and
promoted with a same-filesystem live-to-backup then stage-to-live swap. The
previous public `v0.3.0` copy was retained outside every Skill discovery root.

An independent postflight confirmed six live files, no reparse entry,
and installed `SKILL.md` SHA-256
`8c6a3a2cd0d60a5ad2d7000ccea896e87816794bbce5283c40a0257e9bf034a9`.
It also confirmed the retained six-file `v0.3.0` rollback copy, a parseable
UTF-8-without-BOM private receipt, and no leftover staging or temporary receipt
path. No commit, push, tag, Release, or other public mutation occurred.

This evidence established those installed package bytes only. A
fresh Codex task has not bound its actually selected and loaded body to
those bytes, so loaded-copy behavior and the revised implicit-selection
presentation remain `UNKNOWN`. The local development copy is not a stable
release or publication claim.

## Independent release qualification

### Consumed SOURCE behavior evidence

A single bounded qualification used `gpt-5.6-sol` with high reasoning against the exact committed candidate instructions and two tracked case/fixture sets at `6b0bf47fdc10722b830508af9077288601b55ab9`. It ran ephemerally, ignored ambient user configuration and project rules, received the authorized committed inputs inline, invoked no tools, and attempted no mutation.

- `project-docs-conflict` behavior slice: `PASS`. The response preserved competing authority, frozen history, `UNKNOWN` claims, the dirty user-owned source boundary, and the explicit approval gate before any canonical or structural write. Controller-observed exact-candidate selection/load was not exercised and remains `UNKNOWN`.
- `project-docs-mature-noop` behavior slice: `PASS`. The response selected `NOOP`, preserved the compact single-owner layout, avoided a parallel document suite, and did not claim unrun runtime verification. Controller-observed body/reference reads and the four selection-negative contexts were not exercised and remain `UNKNOWN`.

This evidence is consumed and must not be repeated to obtain a preferred answer. It proves only the two bounded SOURCE behavior slices; it does not prove selection/load coverage, negative contexts, installed-copy behavior, publication, or broad efficacy.

### Historical B1 local candidate gates

The following gates applied to the historical B1 candidate, not to the current
source-only revision or its authorization. They required these checks after
the tracked diff was frozen:

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
The persistent lifecycle and loaded-copy evidence was accepted as public evidence id
`B2-MPD-COMPLETE-02` and is `VERIFIED`. Broad efficacy, broader negative-context
coverage, write/adoption behavior, monorepos, generated documentation, external
owners, and other untested contexts remain `UNKNOWN`.
