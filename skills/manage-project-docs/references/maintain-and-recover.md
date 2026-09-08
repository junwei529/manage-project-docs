# Maintain And Recover

Use this reference for routine documentation impact, persistent continuity,
pause, handoff, and recovery.

## Contents

- [Maintain Existing Owners](#maintain-existing-owners)
- [Choose Update Modes By Content](#choose-update-modes-by-content)
- [Mixed Document Examples](#mixed-document-examples)
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

For a routine event, start from changed durable facts before freezing the diff:

1. Follow the target project's existing read and write routing.
2. Identify each changed fact's canonical owner and bounded actual consumers
   from existing links, routing, and generation mechanisms. Include consumers
   outside the diff; the changed-file list is not the impact boundary.
3. Revalidate relevant code, tests, Git state, and external evidence. Source,
   installed bytes, and actual runtime/load behavior are separate facts. An
   approved change is not proof of implementation or verification.
4. Verify authorization, targets, and the current writer immediately before
   mutation. Reuse a clear direct request or approved concrete scope; this
   check does not require another question per file, tool, or internal step.
   Keep read-only requests read-only. Resolve new effects or writer conflicts
   before the affected action; do not infer new authority from Skill selection.
5. Apply the appropriate content/section update mode below. Update changed
   owners and necessary consumers; replace duplicated current facts with links
   or bounded summaries, including repetition inside one file.
6. For a mechanically searchable old value, search only the mapped consumers.
   Distinguish stale current claims from valid historical values. Check meaning
   and coverage: formatting, matching text, or passing hashes cannot show that
   every material consumer was considered.
7. Record each material consumer as updated or checked with no change, with
   bounded verification and limitations. Reuse existing checks and generators;
   do not add a full-repository audit to every task. Use `PROPOSE` when an
   unapproved structural or owner change is needed.

Do not turn a current-state section into a chronological execution log.
Preserve necessary history in its existing section or decision/evidence owner,
and keep the current recovery entry short enough to use directly.

## Choose Update Modes By Content

A file is a container. Select the mode for its content or major section, not
from its filename. Record only distinctions needed for correct maintenance;
per-paragraph metadata is not required.

| Content | Update mode |
|---|---|
| Current state | Replace a coherent snapshot at a material checkpoint, including evidence, gate, writer, and next action as applicable |
| Current contract or working rule | Revise for approved changes; keep approval distinct from implementation and preserve necessary rationale |
| Frozen result, accepted historical rationale, or historical snapshot | Preserve the record; append a successor or correction at the permitted owner and update the current entry |
| Derived view | Update the true source and use the existing generation process; retain source and evidence identity |

Replacement, invalidity, and current applicability are separate relationships
for plans, decisions, results, contracts, and other content. State the affected
scope and basis when material:

- A successor may replace only part of an earlier record. Identify which part
  and what remains applicable; a later date does not imply full replacement.
- An invalid result may have no valid successor. Keep the evidence, explain
  why it cannot support the current claim, and preserve the unresolved state.
- Historical or older content may still govern an unchanged scope or remain
  valid evidence for its original input. Do not replace old versions globally.
- An approved plan can be the current contract while its implementation is
  pending. Record both facts rather than marking the work complete.

Do not edit a frozen record to insert its later disposition. Its current
index, recovery entry, or later authorized record describes the successor,
correction, partial replacement, or invalidity and links to the retained
original. If no safe current owner exists, report that routing gap.

## Mixed Document Examples

These are mapping examples, not files to create. Preserve mature names and
grouping; different lifecycles can coexist in one file.

| Existing container | Common mixed content and treatment |
|---|---|
| README / AGENTS | Revise current usage or work rules when authorized; link to current state and evidence owners instead of duplicating them. Keep necessary historical examples visibly scoped. |
| SPEC / DESIGN | Revise the current approved contract; retain historical rationale or link to it. A newly approved design does not establish implementation. |
| STATE | Replace the current checkpoint and reduce repeated current facts and execution narrative. Preserve any frozen section and leave concise evidence/recovery pointers. |
| ISSUES | Update the present issue/disposition and next action; retain prior attempts and evidence needed to explain unresolved or recurring failures. A new attempt does not erase an old failure. |
| VERIFICATION | Revise the current method and prerequisites; preserve dated results, input identities, failures, and limits. Update the current result entry separately. |
| PLAN | Revise the active approved plan within authorization; distinguish proposals, approved work not yet implemented, and frozen prior plans. Describe partial replacement explicitly. |
| DECISIONS | Maintain the current decision index; preserve accepted historical rationale and append successor decisions with scope. Later dates do not automatically win. |
| HANDOFF | Replace the current recovery entry at a material transfer; retain frozen handoff evidence if required, but remove duplicate current narratives and point to the evidence owners. |
| PROVENANCE / CHANGELOG | Update current source mappings or unreleased notes at their true owner; preserve released provenance and frozen release history. New source bytes do not prove installation, runtime behavior, or publication. |

When a combined file repeats the same current fact in a summary, status table,
and recovery paragraph, keep one authoritative statement and use concise
references elsewhere. Retain repetition only where a concrete reader need
justifies its maintenance; check that those summaries describe one checkpoint.

## Keep Recovery State Coherent

Treat current state, current writer, current gate, next safe action, and
recovery target as one verified snapshot. Revalidate them together and make
them describe the same checkpoint. If they disagree, report continuity as
weak and first converge their existing canonical owners; do not preserve
several incompatible current narratives.

A reader or active session is not automatically the current writer. Read-only
inspection may proceed alongside other sessions, but immediately before a
persistent update, verify writer and authorization facts. An existing valid
approval is enough for its scope; another active read-only session is not a
writer conflict. If no single recovery target can be trusted, or convergence
requires an unapproved owner, route, or authority change, return `PROPOSE`.

When the durable anchor and its named recovery entry remain valid, preserve
that exact recovery target during a routine update. Changing the named target
is a routing change requiring authorization for that effect; reuse existing
specific approval, or propose it before changing the target or its anchor.

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

Maintain an existing valid recovery entry through its current routing and
applicable specific authorization; this does not require new structural
permission. Create an entry only when no equivalent exists and the creation's
structural effects are explicitly authorized, reusing that approval if already
given. Stop the affected mutation for unresolved permission, writer, or routing
conflicts. Record:

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
