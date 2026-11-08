# Maintain And Recover

Use this reference for routine documentation impact, persistent continuity,
pause, handoff, and recovery.

## Contents

- [Maintain Existing Owners](#maintain-existing-owners)
- [Learning And Reuse Events](#learning-and-reuse-events)
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
| A reusable correction, method or missed precedent is verified | Existing knowledge owner and necessary discovery entry; use Learn And Reuse when placement or applicability needs judgment |
| Priority or dependency changes | Future-work owner |
| Work pauses, transfers, or context becomes unreliable | Recovery owner |

For a routine event, separate general-document maintenance from changes governed
by [Project Rule Confirmation](../SKILL.md#project-rule-confirmation). A method/result
update may proceed; creating or retiring a standing rule requires the user's
confirmation. Recording a rule already confirmed by the user does not require a
second decision. Start from changed durable facts before freezing the diff:

1. Follow the target project's existing read and write routing.
2. Identify each changed fact's canonical owner and bounded actual consumers
   from existing links, routing, and generation mechanisms. Include consumers
   outside the diff; the changed-file list is not the impact boundary.
3. Inspect the evidence needed for the changed claim and reuse valid checks.
   Do not rerun code, tests or external effects merely because prose changes.
   Source, installed bytes and runtime/load behavior remain separate facts;
   an approved change is not proof of implementation or verification.
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
7. Verify affected meaning, links and material consumers. Include actual changes
   and remaining gaps in the normal task delivery; do not create a consumer ledger
   or full audit for routine edits. Use `PROPOSE` only for concrete effects that
   still need a decision.

Do not turn a current-state section into a chronological execution log.
Preserve necessary history in its existing section or decision/evidence owner,
and keep the current recovery entry short enough to use directly.

## Learning And Reuse Events

Use [Learn And Reuse](learn-and-reuse.md) for retention value, evidence strength,
placement and future applicability. Complete material owner and entry updates
in the same authorized work. At a milestone or handoff, catch omitted knowledge
impact without requiring a new lesson or report. At reuse, check changed conditions
and correct stale guidance instead of accumulating parallel current statements.
A discoverer who is not the writer uses the existing authorized handoff route.

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

When the durable anchor and its recovery responsibility remain valid, preserve
them during routine updates. Correct a stale link to the same established owner
within maintenance authority. Selecting a new owner or recovery responsibility
needs authority for that effect; reuse it when already given.

## Maintain The Continuity Anchor

The continuity anchor belongs in the target project's existing instruction or
governance entry. Keep concrete routes and genuine local exceptions needed by its
readers: the starting entry, relevant methods or precedents, current recovery
location and writer/permission constraints where material. Omit unused fields.
Do not copy the Skill's general event, learning or approval algorithm into every
project. Existing explicit project contracts remain effective within their scope.

Do not copy current status, product facts, decisions, or full verification
results into the anchor.

On relevant later work, check the owners and conditions needed for that task.
Refresh only a broken pointer within authority, reconsider only an affected
responsibility, and rediscover the full map only when scope or authority is
broadly unreliable.

When routing and update modes remain valid, an ordinary task follows them
without loading Project Docs. Distillation or reuse questions can select the
learning reference; actual governance gaps can select the audit reference.
A project anchor gives concrete routes rather than copying this Skill's full
workflow. Neither that anchor nor implicit selection creates new authority.

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

Maintain an existing valid recovery entry within the applicable authorization.
If no equivalent exists, distinguish a minimal handoff note covered by the task
from establishing a new recovery authority or governance arrangement. Resolve
only missing authority for actual effects, not a first-file ceremony. Stop the
affected mutation for unresolved permission, writer or routing conflicts. Record:

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
