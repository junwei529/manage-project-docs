# Project Docs State

## Current implementation

Canonical editable source is the 6-file package under
[`skills/manage-project-docs/`](../../../skills/manage-project-docs/). Every package file and retained
case or fixture is an exact Git blob from `80910a8b2375a11be897e9660c4b00a06d00dd13`.

## Repository ownership

This repository owns its Git history, documentation, checks, and future version,
evaluation, installation, and release decisions. It has no implicit dependency
on another Skill repository and begins with no configured remote.

## Evidence state

The migration proves current package byte identity, mapped case and fixture byte
identity, local link and publication-safety checks, and repository-local
verification. Fresh native selection, installed-copy behavior, publication, and broad efficacy are not established by this migration.

## Next gate

Any remote, installation, tag, release, publication, or behavior-evaluation
action requires its own authority and fresh evidence. Ordinary local changes
must preserve the provenance record or explicitly supersede the mapped baseline.

## Recovery entry

Read the root [`AGENTS.md`](../../../AGENTS.md),
[`PROVENANCE.md`](../../../PROVENANCE.md), [Design](DESIGN.md), this State, and
[Verification](VERIFICATION.md). Verify Git status, current branch, package
identity, and writer ownership before changing files.

## Independent v0.3.0 release state

The approved public repository identity is `junwei529/manage-project-docs`; the first independent Release target is `v0.3.0`. This remains a local candidate until publication is separately authorized and proved.

| Evidence layer | State | Basis and limit |
| --- | --- | --- |
| Candidate/package identity | `WORKTREE_VERIFIED` | Before commit, the repository checker validates the working-tree inventory, provenance target hashes, and exact six-file Skill package. The local commit plus a clean post-commit checker rerun must bind those bytes to a Git tree. |
| SOURCE behavior | `BEHAVIOR_SLICE_VERIFIED` | One consumed `gpt-5.6-sol` / high, ephemeral, tool-free qualification at standalone candidate commit `6b0bf47fdc10722b830508af9077288601b55ab9` passed the conflict-governance and mature-noop behavior slices without mutation. Controller-observed selection/load and negative-context coverage remain `UNKNOWN`. |
| `LOCAL_RELEASE_READY` | `LOCAL_RELEASE_READY` | Exact candidate C commit `64334af68116966058aae3df6ef41941e369ef2c`, tree `472dc520eb0fff7f60f178223230e1b5b0ba2af9`, received Planner `ACCEPTED` at checkpoint `B1-MPD-Q02-C`. Its Completion Packet/evidence locator is `B1-MPD-Q02-C`. Receipt R records that accepted evidence and this explicitly allowed readiness transition. |
| `PUBLIC_RELEASE` | `UNKNOWN` | No remote, tag, GitHub Release, or publication is created by this local qualification. |
| `STABLE_INSTALLED_COPY` | `UNKNOWN` | No persistent or isolated copy is installed, updated, uninstalled, rolled back, or activated by this local qualification. |
| broad `EFFICACY_BOUNDARY` | `UNKNOWN` | Two source cases do not establish broad product efficacy. |

Closeout has three distinct identities. C is the immutable B1 qualification candidate accepted by the Planner at checkpoint `B1-MPD-Q02-C`; its exact commit and tree are recorded above. This repo-local governance receipt is R. R records C, C's tree, the `ACCEPTED` verdict, and the Completion Packet/evidence locator in this state owner; changes `LOCAL_RELEASE_READY` from `PENDING_PLANNER_ACCEPTANCE` to `LOCAL_RELEASE_READY`; updates `provenance/source-map.json`; and must pass a clean post-commit repository checker. The receipt and readiness transition are R's only semantic change. R does not change lifecycle instructions, package/evaluation/checker bytes, qualification criteria or meaning, evidence inputs or results, public-release identity, or installed-copy claims. P is the future B2 public `v0.3.0` Release commit and remains `UNKNOWN`; neither C nor R is P.

The future lifecycle owner is the root README. It defines immutable-source install, staged update, bounded uninstall, and rollback behavior. Every persistent installation or publication effect remains separately authorized. Human-reviewed Release notes must preserve the migration and evidence boundaries rather than promote local or SOURCE evidence into public or installed-copy claims.
