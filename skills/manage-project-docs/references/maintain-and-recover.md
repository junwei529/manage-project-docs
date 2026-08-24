# Maintain And Recover

Use this reference for routine documentation impact, persistent continuity,
pause, handoff, and recovery.

## Contents

- [Maintain Existing Owners](#maintain-existing-owners)
- [Keep Recovery State Coherent](#keep-recovery-state-coherent)
- [Maintain The Continuity Anchor](#maintain-the-continuity-anchor)
- [Pause And Handoff](#pause-and-handoff)
- [Recover](#recover)
- [Completion Report](#completion-report)

## Maintain Existing Owners

Treat these as common document-impact events:

| Event | Update |
|---|---|
| Durable behavior or interface changes | Intended contract and acceptance owner |
| Architecture, trust, or operational boundary changes | Boundary owner and related decision |
| Implementation or test state changes | Current-state and evidence owner |
| A material decision is accepted | Decision record and current contract |
| Priority or dependency changes | Future-work owner |
| Work pauses, transfers, or context becomes unreliable | Recovery owner |

For a routine event:

1. Follow the target project's existing read and write routing.
2. Revalidate the relevant code, tests, Git state, and external evidence.
3. Apply the owner's recorded update mode. Replace a current-state snapshot as
   one coherent unit; revise a current contract in place; append or supersede a
   decision or evidence record; and update generated or external facts only at
   their editable source.
4. Update only the existing canonical owners whose facts changed.
5. Replace stale duplicates with links or bounded summaries.
6. Use `PROPOSE` instead of redesigning structure when routing is insufficient.
7. Record actual verification and its limitations.

Do not turn a current-state owner into a chronological execution log. Preserve
history in its existing decision or evidence owner, and keep the current owner
short enough to recover from directly.

## Keep Recovery State Coherent

Treat current state, current writer, current gate, next safe action, and
recovery target as one verified snapshot. Revalidate them together and make
them describe the same checkpoint. If they disagree, report continuity as
weak and first converge their existing canonical owners; do not preserve
several incompatible current narratives.

A reader or active session is not automatically the current writer. Read-only
inspection may proceed alongside other sessions, but immediately before a
persistent update, re-confirm the writer and authorization facts used by that
update. If no single recovery target can be trusted, or convergence requires a
new owner, route, or authority choice, return `PROPOSE` instead of redesigning
the document structure as routine maintenance.

When the durable anchor and its named recovery entry remain valid, preserve
that exact recovery target during a routine update. Changing the named target
is a routing change, not ordinary state maintenance; propose it first and
require structural authorization before changing the target or its anchor.

## Maintain The Continuity Anchor

The continuity anchor belongs in an existing target-project instruction or
governance entry. Keep only:

- the read order or responsibility-map entry;
- events that require documentation impact;
- the structural authorization gate;
- the recovery entry;
- the stop route for missing permission, writer conflict, or broken mapping.

Do not copy current status, product facts, decisions, or full verification
results into the anchor.

On later tasks, validate that every referenced owner still serves the named
responsibility. Refresh only a broken route, re-map only an affected owner, and
run full rediscovery only when scope or authority is broadly unreliable.

When routing and update modes remain valid, an ordinary task follows them
without loading Project Docs. If a later governance request exposes a broken
route, missing owner, new scope, or incompatible update lifecycle, Project Docs
may be rediscovered implicitly to inspect and propose repair. The anchor does
not invoke the Skill, and implicit selection does not authorize the repair.

If the active Harness cannot load or verify the anchor, report weak continuity;
installing this Skill does not make the target-project rule persistent.

Classify continuity for the inspected scope:

- `strong` only when the active Harness verified the durable anchor and
  recovery entry, the owners needed for the stated recovery path are available,
  and no known permission, writer, or mapping boundary blocks that path;
- `weak` when the persistent entry cannot be written, loaded, or verified, a
  required owner is unavailable, or permission, writer, or routing state blocks
  the claimed recovery path;
- `not applicable` when the run did not assess or promise persistent recovery.

## Pause And Handoff

Maintain or create a recovery entry only when no equivalent exists and
structural writes are authorized. Record:

- goal and current bounded scope;
- completed and incomplete work;
- publish-safe workspace and writer state;
- last verified checkpoint and evidence;
- blocker or unresolved decision;
- next safe action and required read order;
- actions that remain unauthorized.

Do not require a `HANDOFF.md` filename, paste raw logs, or treat chat history as
the recovery source.

## Recover

1. Follow the applicable project instructions already loaded by the Harness
   and read the routed recovery entry.
2. Revalidate scope, branch or checkout, commit state, dirty ownership, active
   writer, and the last cheap evidence checkpoint.
3. Compare the durable record with current state.
4. Apply the primary outcome and stop rules in `SKILL.md` to the revalidated
   state; do not resume outside the recorded authority.

## Completion Report

After the last command that may write, inspect the actual target file and Git
state. Account for generated, ignored, and untracked artifacts as well as
intentional edits. Remove only artifacts created by this run when cleanup is
authorized and safe; otherwise report them. Do not infer “no file changes” from
the intended edit list.

Use the report fields and continuity taxonomy defined in `SKILL.md`.
