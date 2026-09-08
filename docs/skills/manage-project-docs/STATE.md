# Project Docs State

## Current implementation

Canonical editable source is the 6-file package under
[`skills/manage-project-docs/`](../../../skills/manage-project-docs/).
The approved source candidate is **v0.4.0**, unreleased. All six package files
and five case definitions are independently mapped normalized-text rewrites;
retained fixtures remain exact source blobs and setup/inspection scripts retain
their existing mapped compatibility adaptations.
The [Design](DESIGN.md) maps necessity judgment, mixed-content lifecycle,
consumer impact, and authorization continuity to the existing package files.

## Repository ownership

This repository owns its Git history, documentation, checks, and future version,
evaluation, installation, and release decisions. It has no implicit dependency
on another Skill repository. Its public origin is
`https://github.com/junwei529/manage-project-docs`.

## Evidence state

Current candidate status: the approved source scope is independently accepted;
local validation is complete and no implementation is active. This is source
acceptance only, not release readiness. The provenance manifest binds source mappings and
target bytes; [Verification](VERIFICATION.md#current-source-validation) owns
the local checks, semantic coverage map, and remaining evidence gaps.

The local user installation now matches the accepted six-file source candidate
as a `LOCAL_DEVELOPMENT_COPY`. Its byte, permission, readability, and retained
rollback evidence is recorded in [Local Installation](VERIFICATION.md#local-installation).
The earlier entry-presentation copy remains available for rollback. Fresh-task
loading and model behavior for the candidate are `UNKNOWN`. B2 publication and
installed-copy qualification below still apply only to historical public
`v0.3.0`; the new local installation is not a stable release.

## Next gate

The accepted source update and local installation are complete. Local delivery
authorization includes staging, required checks, native review, and commit of
the candidate and necessary records. A local commit remains conditional on
the repository checks and native-review gate; Git and the resulting completion
record establish the actual committed identity.

Remote push requires a concrete transport and exact-ref decision after the local
commit gate. No push, model/API case run, tag, Release, global migration, or
other external effect is included in this local window. Preserve provenance,
earlier evidence, and retained rollback copies.

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
| `PUBLIC_RELEASE` | `PUBLISHED` | Public repository `junwei529/manage-project-docs` had remote `main` at P `02a1494e7dd22f9b598b752057c792aa3b2e3ae2` at publication time. The moving default branch may contain later evidence or correction commits and requires live ref verification; annotated tag `v0.3.0` has tag object `f620a2af6bbef25ca4195cf29953c7a1c0084181` and peels to P; the non-draft, non-prerelease Release is `https://github.com/junwei529/manage-project-docs/releases/tag/v0.3.0` with the exact human-approved notes. Package tree remains `21971e5d8872c9c131675a926e45fdcfad31d95c`. |
| `STABLE_INSTALLED_COPY` | `VERIFIED` | Public-tag isolated install, exact legacy `v0.2.0` identification, staged update, origin-aware quarantine/uninstall, restoration, persistent atomic switch, fresh-task loaded-copy behavior, negative discovery, and restored-copy rebinding all passed for public `v0.3.0`. Planner accepted this installed-copy evidence as public evidence id `B2-MPD-COMPLETE-02`. This remains historical stable-release evidence; it is not the identity of the current live user copy. |
| Earlier local installation checkpoint | `LOCAL_DEVELOPMENT_COPY` | After explicit local-only authorization, the earlier six-file entry-presentation package passed source validation, exact public-`v0.3.0` live preflight, reparse rejection, fresh staging, same-filesystem atomic promotion, retained rollback verification, and independent postflight. Its `SKILL.md` SHA-256 is `8c6a3a2cd0d60a5ad2d7000ccea896e87816794bbce5283c40a0257e9bf034a9`. The exact previous `v0.3.0` copy and a private install receipt remain outside Skill discovery roots. No public release state changed. Fresh-task loaded-copy behavior remains `UNKNOWN`; this is not new-candidate installation or stable-release acceptance. |
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
release. Retained rollback copies are not authorized for deletion. The
human-reviewed Release notes preserve migration and evidence limits; neither
publication, stable installed-copy qualification, nor current local
development installation expands broad efficacy.
