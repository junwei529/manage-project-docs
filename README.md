# Project Docs

[简体中文](README.zh-CN.md)

Keep project documentation in step with the project.

Project Docs is a project-document governance Skill for Codex. It helps you
decide which content is worth maintaining, where facts should be maintained,
and which documents need updating when the project changes.
The goal is to help people and AI find trustworthy current information while
keeping document count and maintenance costs under control.

## What it helps with

- **Decide which documentation is needed.** Start from the decisions readers need to make, then identify what to add, retain, combine, or simplify.
- **Reduce duplicate maintenance.** Give each fact a primary maintenance location, connect other documents through references or necessary summaries, and preserve a sound existing structure.
- **Keep changes reflected in documentation.** Distinguish current state, lasting agreements, and historical conclusions, then find the documents and references affected when facts change.

## An example

A README says a feature is complete, a plan still lists it as pending, and a
historical report retains earlier limitations. Project Docs helps you examine
the purpose and evidence behind each statement: which describes current state,
which preserves history, and which needs correction. It then proposes specific
maintenance changes and completes updates within the authorized scope.

## Use

After installation, describe what you want:

- **Initialize documentation:** inspect the existing layout and propose the smallest necessary additions.
- **Check documentation:** identify unnecessary, outdated, or contradictory content.
- **Map documentation:** explain where different information is maintained and when it is updated.
- **Simplify documentation:** find duplicate content that can be combined, referenced, or archived.

You can also invoke the Skill explicitly:

```text
$manage-project-docs
Check this project's documentation for duplication, outdated content, or contradictions.
First report the problems and propose specific changes. Preserve the structure that already works.
```

A check can focus on a local question; routine maintenance follows the
project's existing rules.

Learn more: [Design](docs/skills/manage-project-docs/DESIGN.md) / [Verification scope](docs/skills/manage-project-docs/VERIFICATION.md) / [Evaluation scenarios](evals/README.md).

<details>
<summary>Installation, versions, and verification</summary>

This repository independently maintains the six-file
[`manage-project-docs` package](skills/manage-project-docs/).
The [current source candidate](docs/skills/manage-project-docs/STATE.md#current-implementation)
is distinct from the installed copy and historical public release. Its package
and case definitions are independent normalized-text rewrites with retained
[source provenance](PROVENANCE.md).

Natural-language entries express intent, not write permission. Existing
explicit authorization remains valid for its scope without another question
per file. Synonyms such as “重新检查” (recheck) are interpreted from the complete
request, whether it asks for a read-only report or an authorized update. Start
from the named object and question, follow necessary owners, rules, evidence,
and direct consumers, and load only the needed reference. Ordinary requests
such as “sync the docs” or “update the README” follow valid project routing
without loading the Skill every time.

## Repository contents

- Product package: [`skills/manage-project-docs/`](skills/manage-project-docs/)
- Product design and state: [`docs/skills/manage-project-docs/`](docs/skills/manage-project-docs/)
- Evaluation cases and fixtures: [`evals/`](evals/README.md)
- Standalone verification: [`scripts/check_repository.py`](scripts/check_repository.py)
- Source mapping: [`PROVENANCE.md`](PROVENANCE.md) and
  [`provenance/source-map.json`](provenance/source-map.json)

## Verify

```powershell
python -B scripts/check_repository.py --json
```

The repository has no implicit dependency on another Skill repository. Local
checks do not establish model behavior or installation. The migration snapshot
remains source provenance; the independent `v0.3.0` public
Release and installed-copy evidence are recorded below and in
[`STATE.md`](docs/skills/manage-project-docs/STATE.md).

## Independent v0.3.0 release lifecycle

The public identity is `junwei529/manage-project-docs`. Its first independent
`v0.3.0` Release continues the legacy public line
`junwei529/skills@v0.2.0`, while the exact six-file package was materialized
from later source commit `80910a8b2375a11be897e9660c4b00a06d00dd13`; it is
not byte-identical to the `v0.2.0` tag. Public tag `v0.3.0` is bound to release
commit P `02a1494e7dd22f9b598b752057c792aa3b2e3ae2`.

Release notes are a human-reviewed publication artifact. The public `v0.3.0`
Release uses the exact approved title and body describing the legacy `v0.2.0`
lineage, post-`v0.2.0` package delta, immutable P, included six-file Skill
package, verification performed, compatibility limits, and unresolved evidence
boundaries.

The lifecycle route is deliberately pinned to immutable commits:

1. **Install:** after the public `v0.3.0` tag and Release exist, record the exact commit resolved from the reviewed Release. Invoke the installed `$skill-installer` helper against `junwei529/manage-project-docs`, `--ref <release-commit>`, and `--path skills/manage-project-docs`. The helper installs to `$CODEX_HOME/skills/manage-project-docs` and aborts if that destination already exists.
2. **Verify:** compare the installed six-file package inventory and SHA-256 values with the package at `<release-commit>`, then create a new cold Codex task. In that task, bind the actually loaded copy's six-file inventory and hashes to `<release-commit>` and run the applicable installed-copy behavior proof before accepting the installation. A later turn in the installation task is insufficient, and source qualification is not installed-copy proof.
3. **Update:** first compare the live inventory and hashes with its recorded installed commit. If local changes exist, stop for an explicit preserve, migrate, or discard decision. Resolve the new reviewed Release to its immutable commit, install it into fresh staging with `--dest`, verify it there, then separately authorize a same-filesystem swap: live to rollback backup, staged to `$CODEX_HOME/skills/manage-project-docs`. If the second rename fails, immediately restore the backup; if restoration fails, preserve every surviving path and stop for recovery. After a successful swap, create a new cold Codex task. In that task, bind the actually loaded copy's six-file inventory and hashes to the new immutable commit and run the applicable installed-copy behavior proof before accepting the update. If activation or verification fails, move the failed live directory to a unique evidence path before restoring the backup; if either move or restoration fails, preserve all paths and stop for recovery. After restoration, create another new cold Codex task, bind the actually loaded restored copy to the recorded previous commit, and rerun the applicable installed-copy behavior proof; if that fails, preserve the recovery state and stop. Retain the backup and failed-copy evidence until acceptance. Never overwrite an existing destination in place.
4. **Uninstall:** after separate authorization, verify the exact target user-installation path, bind its inventory and hashes to the recorded installed commit, record whether it has local changes, and record its former live path and discovery/load origin. Stop on a modified or ambiguous directory. On the same filesystem, rename that live Skill directory to a unique quarantine path outside every Skill discovery root; do not recursively delete it. Create a new cold Codex task and prove that the exact quarantined target origin is no longer discovered or loaded before accepting the uninstall. Separately identified project-, admin-, or system-scoped same-name copies are allowed and do not fail this origin-aware proof. If the target origin cannot be excluded reliably, keep uninstall `UNKNOWN` and restore the quarantined copy when safe; if rename, proof, or restoration is ambiguous or fails, preserve every path and stop for recovery. Permanent deletion of the quarantined copy is a later, separately authorized cleanup effect after uninstall acceptance; a deletion failure does not erase the recoverable uninstall state.
5. **Rollback:** install the previously accepted immutable commit into fresh staging, verify it, and use the update step's same local-change preflight, bounded swap, and failure-recovery procedure. Create a new cold Codex task, bind the actually loaded copy's six-file inventory and hashes to the rollback commit, and rerun the applicable installed-copy behavior proof before accepting the rollback. A later turn in the rollback task is insufficient.

The approved B2 qualification exercised the exact `v0.3.0` publication,
install, update, origin-aware uninstall/quarantine, restoration, and fresh-task
loaded-copy route. Any later replacement, rollback, deletion, tag, Release, or
publication remains a separate effect requiring its own authority.

Release closeout keeps three identities distinct:

- **C:** the immutable B1 qualification candidate assessed by the Planner. After C is committed it is `PENDING_PLANNER_ACCEPTANCE` until the Planner returns `ACCEPTED` for that exact commit and tree.
- **R:** a later repo-local governance receipt commit. R is prohibited before exact C is accepted. It may record C, C's tree, the verdict, and the evidence pointer; change `LOCAL_RELEASE_READY` from `PENDING_PLANNER_ACCEPTANCE` to `LOCAL_RELEASE_READY`; update the required existing hash/provenance consumers; and pass a clean post-commit repository checker. Those receipt and readiness-transition bytes are R's only allowed semantic delta. R must not change lifecycle instructions, package/evaluation/checker bytes, qualification criteria or meaning, evidence inputs or results, public-release identity, or installed-copy claims. Any broader delta stops for a new acceptance disposition.
- **P:** the immutable public `v0.3.0` Release commit
  `02a1494e7dd22f9b598b752057c792aa3b2e3ae2`. Its parent is R; its repository
  and package trees are unchanged from R. Neither C nor R is P, and later
  evidence commits must not move tag `v0.3.0`.

`PUBLIC_RELEASE` is `PUBLISHED`. `STABLE_INSTALLED_COPY` is
`VERIFIED`. Broad `EFFICACY_BOUNDARY` and untested
contexts remain `UNKNOWN`.

</details>
