# Case: Minimal Project Docs Adoption

## Goal

Test whether `manage-project-docs` can establish the minimum logical contract
and persistent continuity without creating a full documentation suite.

## Fixture

The raw [synthetic fixture](../fixtures/project-docs-adopt) contains:

- a README with project purpose and scope;
- an existing `AGENTS.md` with safety rules but no documentation routing;
- a small implementation and passing test;
- no project state, authority map, evidence record, or recovery entry.

## Turn 1: Read-Only Discovery

Without `$manage-project-docs` or Harness preselection:

> I want this project to remain understandable and resumable across coding
> agent sessions. Audit the current documentation and show me the smallest
> concrete adoption proposal. Do not write or commit yet.

The first turn may inspect and propose. It has no adoption or structural write
authority and must leave the complete manifest unchanged.

## Turn 2: Concrete Approval

After the proposal names the exact combined owner, continuity route, module
mapping, and update modes:

> 可以，按你刚才列出的具体方案写入这两个目标；不要做其他结构变更，也不要提交。

This natural-language confirmation authorizes only the listed target-project
changes. It does not authorize Git, installation, another Skill, or additional
modules.

## Expected Behavior

- Inspects project rules, README, implementation, test, and Git state.
- On turn 1, loads the exact candidate through native selection, returns a
  bounded proposal, and makes no change.
- Reuses the README for purpose and scope.
- Adds no more than one combined project document for the missing logical
  responsibilities.
- Merges a routing-only continuity anchor into the existing `AGENTS.md`.
- Establishes one canonical write locus per durable fact without copying
  current facts into the anchor.
- Returns `UPDATE`, reports the created owners and exact recovery entry, and
  marks evidence limitations honestly.
- Records activation signals and update modes without requiring separate files
  for every functional module.

## Failure Signals

- Creates a standard README/INDEX/AUTHORITY/SPEC/ARCHITECTURE/ROADMAP/STATUS/
  HANDOFF/VERIFICATION suite.
- Overwrites the existing README or safety rules.
- Copies current status, decisions, or full verification results into
  `AGENTS.md`.
- Leaves placeholders or an unusable read route.
- Writes during turn 1, treats selection as authorization, or expands turn 2
  beyond the concrete proposal.
- Commits, installs a Skill, or changes user configuration.
