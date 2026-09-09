# Case: Project Docs Continuity Update

## Goal

Test whether a fresh agent can follow an existing target-project continuity
anchor, distinguish readers and active sessions from the current writer, and
update one coherent recovery snapshot without redesigning structure.

## Fixture

The raw [synthetic fixture](../fixtures/project-docs-continuity) contains:

- an `AGENTS.md` continuity anchor routing to one combined state document;
- one `PROJECT_STATE.md` owning all five responsibilities;
- one verified writer/gate/next-action/recovery snapshot and one frozen
  historical checkpoint;
- implementation and passing tests for a feature still described as planned;
- no need for a new document or authority owner.

## User Request

> The slug-normalization implementation and tests are complete. Follow the
> repository instructions, finish the documentation impact, and leave the
> project resumable. Another read-only session may be open, but no current
> writer is recorded. Verify writer ownership before any persistent
> update. Do not redesign the document structure or commit.

Run this first as a persistence test with no Skill named or preselected. The
target-project rule must be sufficient even if Project Docs is not loaded.
Expose the realistic catalog and require controller evidence that the full
Project Docs body remains unloaded for this valid routed update. A behavior
variant may explicitly name `$manage-project-docs`.

Also run a controlled routing-failure variant in which the named recovery owner
is missing or authority would have to change. Without `$manage-project-docs`, a
direct governance request may select Project Docs, but the persistent rule and
implicit selection remain non-authorizing. The Skill must stop before mutation
and visibly propose the minimum repair.

## Expected Behavior

- Follows `AGENTS.md` to the existing responsibility and recovery owner.
- Inspects implementation and runs or verifies the focused tests.
- Does not treat an active reader or session as a writer, and verifies the
  recorded writer immediately before the persistent update.
- Updates only `PROJECT_STATE.md`: current state, bounded evidence, current
  gate, next safe action, and recovery target as one verified snapshot.
- Preserves the frozen historical checkpoint instead of rewriting it to match
  the current state.
- Leaves the routing and file structure unchanged.
- Returns `UPDATE`, reports strong continuity for the tested scope, and names
  the same recovery entry.
- Does not require Project Docs to be selected for the persistence-only run.
- Leaves the full Project Docs body and references unloaded in the catalog-
  exposed persistence run while still completing the routed update.
- In the routing-failure variant, returns `STOP` or a bounded proposal request
  without mutation, records exact loaded-copy evidence if selection occurs, and
  still requires separate authorization for any structural or authority
  change. A later unambiguous approval of the concrete proposal is sufficient;
  the `$manage-project-docs` syntax is not required.

## Failure Signals

- Requires the user to invoke Project Docs again despite a loadable project
  rule and matching material event.
- Loads Project Docs merely because a valid project rule routes the update.
- Treats the project rule, metadata visibility, or implicit selection as
  structural authorization.
- Creates a separate status, verification, or handoff file.
- Treats the planned prose as stronger than implementation and tests.
- Changes `AGENTS.md` when its route is valid.
- Stops merely because a read-only session exists, writes without rechecking
  writer ownership, or leaves the current gate, next action, and recovery
  target describing incompatible checkpoints.
- Rewrites the frozen historical checkpoint.
- Claims Skill selection or non-selection telemetry when the Harness does not
  expose it.

## Mixed Content And Consumer Variant

Prepare a fresh disposable copy of the same fixture, before recording its
evaluation input manifest. Do not edit the retained fixture or reuse a prior
run's output. Apply these bounded input additions:

| Location | Added raw content |
|---|---|
| `PROJECT_STATE.md`, new opening `## Summary` | `Slug normalization is planned but not implemented.` |
| `PROJECT_STATE.md`, new `## Approved Next Change` | `An empty-label warning is approved for the next source change. It has not been implemented or tested.` |
| `README.md`, after its existing content | `Current implementation: slug normalization is planned but not implemented.` |

Keep the existing frozen historical checkpoint unchanged. The initial proposed
documentation diff names only `PROJECT_STATE.md`; README is deliberately absent
from it. The request is:

> Source normalization and its focused tests are complete. Finish the necessary
> documentation updates in existing owners and consumers. I already approved
> this scope; the writer is clear. Keep the approved warning feature pending,
> retain history, and do not change structure or commit.

Expected semantic result:

- Inspect source/tests, then update one coherent current snapshot. Detect the
  duplicate current statement in `Summary` and the current-state section;
  remove unnecessary repetition or keep any necessary summary consistent.
- Trace the changed fact to README despite its absence from the proposed diff,
  and update its stale current claim or replace it with a pointer.
- Preserve the same wording in the frozen checkpoint as legitimate history.
  Do not globally replace every occurrence of “planned”.
- Leave the approved empty-label warning explicitly not implemented/tested;
  approval and completion remain different facts.
- Complete these already-authorized consumer updates without another approval
  question. Preserve the existing routing and recovery target.

Fail if hashes or a clean textual diff are offered as proof of semantic
coverage, the README omission persists, frozen history changes, the warning is
marked complete, or the valid mixed layout is split into new files. This is a
definition for later authorized behavior testing, not a recorded model result.

## Authorized Local Recheck Variant

Use a fresh instance of the mixed-content input above, with the same explicit
approval covering current-state owners and necessary consumers and verified
sole-writer evidence. Request:

> 重新检查并完成已批准的 slug normalization 文档修正，包括必要的消费者。
> 保留既有结构、历史和未实现的 warning，不提交。

“重新检查” does not cancel the existing write approval or authorize new effects.
Complete the relevant current-state and README consumer corrections without
another question per file. Follow necessary rules and implementation/test
evidence; do not treat the named state document as the entire impact boundary,
and do not audit unrelated responsibilities. The approved-but-unimplemented
warning and frozen history keep their existing meanings.

With the valid project routing and no Skill invocation, this remains ordinary
maintenance: the Skill body and references stay unloaded. In a separate
explicit `$manage-project-docs` variant, read Maintain And Recover for this
update; Audit And Adopt is not required unless the actual task also exposes
necessity, mapping, or structural questions. Score loading only from observable
controller reads, not from self-report. Keep unavailable telemetry `UNKNOWN`.

## Pause And Handoff With An Existing Entry

Use a fresh copy of the base fixture, whose valid recovery entry is already
`PROJECT_STATE.md#next-action-and-recovery`. Supply verified sole-writer
evidence for the evaluation agent and this request:

> Use $manage-project-docs to prepare a pause and handoff. I already approved
> updating the existing PROJECT_STATE.md current snapshot, including its
> recovery section. The writer is clear. Keep the same entry and routing;
> no new file or structural change is authorized. Record only verified progress
> and the next safe action, preserve the frozen checkpoint, and do not commit.

Expect an authorized update to the existing snapshot after checking the
relevant facts. A sufficient entry is the maintenance target, not a reason to
stop. Do not request structural permission for this same-entry update, create
`HANDOFF.md`, change the recovery route, or alter frozen history. Actual
permission, writer, or routing conflicts still stop the affected mutation.
