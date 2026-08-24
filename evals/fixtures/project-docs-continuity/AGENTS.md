# Fixture Agent Instructions

## Project Documentation Continuity

- Read `PROJECT_STATE.md` before making project-level claims.
- Use its canonical write routing; do not duplicate durable facts here.
- Recheck documentation impact after durable implementation, verification,
  priority, pause, or recovery events.
- Update its existing owners with their recorded update modes when routing
  remains valid; do not turn the current snapshot into an execution log.
- Ask before creating, splitting, merging, renaming, migrating, or changing
  authority or canonical ownership.
- When routing is broken or a new module, structural change, or authority
  choice is needed, stop and visibly propose a Project Docs repair. Do not
  mutate until the user confirms the concrete proposal. This routing line is
  neither Skill invocation nor authorization for the change.
- Stop before writing when permission, scope, writer ownership, or evidence is
  unresolved.
- A reader or active session is not automatically the current writer. Recheck
  the current writer in `PROJECT_STATE.md` immediately before a persistent
  documentation update.
- Resume interrupted work from `PROJECT_STATE.md#next-action-and-recovery`.

Do not commit.
