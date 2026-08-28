# Project Docs State

## Current implementation

Canonical editable source is the 6-file package under
[`skills/manage-project-docs/`](../../../skills/manage-project-docs/). Every package file and retained
case or fixture is an exact Git blob from `80910a8b2375a11be897e9660c4b00a06d00dd13`.

## Repository ownership

This repository owns its Git history, documentation, checks, and future version,
evaluation, installation, and release decisions. It has no implicit dependency
on another Skill repository. Its public origin is
`https://github.com/junwei529/manage-project-docs`.

## Evidence state

The migration proves current package byte identity, mapped case and fixture byte
identity, local link and publication-safety checks, and repository-local
verification. B2 publication and installed-copy qualification are recorded
below. Broad efficacy and untested contexts remain unestablished.

## Next gate

Any later remote mutation, release, installation replacement, rollback-copy
deletion, or broader behavior claim requires its own authority and fresh
evidence. Ordinary local changes must preserve the provenance record or
explicitly supersede the mapped baseline.

## Recovery entry

Read the root [`AGENTS.md`](../../../AGENTS.md),
[`PROVENANCE.md`](../../../PROVENANCE.md), [Design](DESIGN.md), this State, and
[Verification](VERIFICATION.md). Verify Git status, current branch, package
identity, and writer ownership before changing files.

## Independent v0.3.0 release state

The approved public repository identity is `junwei529/manage-project-docs`.
The first independent Release, `v0.3.0`, is public and bound to exact release
commit P `02a1494e7dd22f9b598b752057c792aa3b2e3ae2`.

| Evidence layer | State | Basis and limit |
| --- | --- | --- |
| Candidate/package identity | `WORKTREE_VERIFIED` | Before commit, the repository checker validates the working-tree inventory, provenance target hashes, and exact six-file Skill package. The local commit plus a clean post-commit checker rerun must bind those bytes to a Git tree. |
| SOURCE behavior | `BEHAVIOR_SLICE_VERIFIED` | One consumed `gpt-5.6-sol` / high, ephemeral, tool-free qualification at standalone candidate commit `6b0bf47fdc10722b830508af9077288601b55ab9` passed the conflict-governance and mature-noop behavior slices without mutation. Controller-observed selection/load and negative-context coverage remain `UNKNOWN`. |
| `LOCAL_RELEASE_READY` | `LOCAL_RELEASE_READY` | Exact candidate C commit `64334af68116966058aae3df6ef41941e369ef2c`, tree `472dc520eb0fff7f60f178223230e1b5b0ba2af9`, received Planner `ACCEPTED` at checkpoint `B1-MPD-Q02-C`. Its Completion Packet/evidence locator is `B1-MPD-Q02-C`. Receipt R records that accepted evidence and this explicitly allowed readiness transition. |
| `PUBLIC_RELEASE` | `PUBLISHED` | Public repository `junwei529/manage-project-docs` has remote `main` at P `02a1494e7dd22f9b598b752057c792aa3b2e3ae2`; annotated tag `v0.3.0` has tag object `f620a2af6bbef25ca4195cf29953c7a1c0084181` and peels to P; the non-draft, non-prerelease Release is `https://github.com/junwei529/manage-project-docs/releases/tag/v0.3.0` with the exact human-approved notes. Package tree remains `21971e5d8872c9c131675a926e45fdcfad31d95c`. |
| `STABLE_INSTALLED_COPY` | `QUALIFIED_PENDING_PLANNER_ACCEPTANCE` | Public-tag isolated install, exact legacy `v0.2.0` identification, staged update, origin-aware quarantine/uninstall, restoration, persistent atomic switch, fresh-task loaded-copy behavior, negative discovery, and restored-copy rebinding all passed. The live user Skill is exact public `v0.3.0`; the exact legacy rollback copy and manifests remain outside Skill discovery roots. |
| broad `EFFICACY_BOUNDARY` | `UNKNOWN` | Two source cases do not establish broad product efficacy. |

Closeout has three distinct identities. C is the immutable B1 qualification
candidate accepted by the Planner at checkpoint `B1-MPD-Q02-C`; its exact
commit and tree are recorded above. R is the repo-local B1 governance receipt.
P is the immutable public `v0.3.0` Release commit
`02a1494e7dd22f9b598b752057c792aa3b2e3ae2`, whose parent is R and whose tree
and package tree are unchanged from R. The public tag remains bound to P;
later evidence commits are not P and must not move that tag.

The lifecycle owner is the root README. Its immutable-source install, staged
update, bounded uninstall, and rollback route was exercised for this exact
release. The retained rollback copy is not authorized for deletion. The
human-reviewed Release notes preserve migration and evidence limits; neither
publication nor installed-copy qualification expands broad efficacy.
