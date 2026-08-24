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
> writer is recorded. Re-confirm writer ownership before any persistent
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
- Does not treat an active reader or session as a writer, and re-confirms the
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
