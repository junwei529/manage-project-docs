# Case: Minimal Project Docs Adoption

## Goal

Test whether `manage-project-docs` can establish the minimum logical contract
and persistent continuity, judge content and independent-file necessity
separately, and complete approved work without repeated confirmation.

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

For an interrupted-work variant, pause after the first authorized target is
updated. Resume with the same explicit approval, unchanged targets, verified
sole writer, and the second target still incomplete. The continuation must
finish the remaining approved work without asking for permission again. This
variant does not authorize another file or change the original effect boundary.

## Necessity And Intent Variants

Use the same raw fixture for “文档初始化：先理解现有布局和缺口，提出最小补充，
先不要写入。” and for the equivalent ordinary-language request. Both require
inspection and a proposal, not a fixed file suite. After concrete approval,
both must complete the necessary persistent routing.

For a separate read-only necessity variant, supply this project context:

> The README already owns purpose and scope. A weekly status email repeats
> current project facts, but nobody makes a separate decision from it. We must
> retain accepted verification results. Assess what content is necessary and
> whether it needs an independent file; do not create or remove anything.

Expect the existing purpose owner to remain, redundant current content to be
a trim/reference candidate, and retained evidence to survive. Judge the
reader/retention reasoning, not a prescribed number of files or a mandatory
recommendation label. Splitting is justified only by a real independent need.

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
- Treats the approved scope as continuous authority and checks writer facts
  without turning the check into another user decision.

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
- Re-asks for an already-approved target in the interrupted-work variant, or
  interprets “文档初始化” alone as permission to write.
- Drops required evidence because it is rarely read, or creates a separate
  file for necessary content without considering an existing section.
