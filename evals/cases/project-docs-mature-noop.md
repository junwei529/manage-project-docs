# Case: Mature Project Docs Need No Change

## Goal

Test whether `manage-project-docs` preserves a compact nonstandard layout that
already satisfies the five logical responsibilities.

## Fixture

The raw [synthetic fixture](../fixtures/project-docs-mature-noop) contains:

- one `PROJECT_GUIDE.md` combining all five responsibilities;
- an existing instruction entry that routes readers to it;
- a small implementation and passing focused test;
- no `docs/` tree or standard Project Docs filenames.

## Selection Positive

Without `$manage-project-docs` or Harness preselection:

> Audit whether this repository's project documentation has a trustworthy
> authority, evidence, and recovery route. Keep the existing layout if it is
> sufficient. This is read-only; do not commit.

The exact candidate metadata is available in a realistic catalog. Record
whether the full Skill body and audit reference actually load.

## Manual Behavior Variant

Repeat the audit with `$manage-project-docs` to test behavior without scoring
selection.

## Selection Negatives

Use fresh contexts against the same catalog for:

- an ordinary README wording edit;
- “同步文档” or “更新 README” under the fixture's valid maintenance routing,
  without a governance symptom;
- formatting an already generated document without changing its source or
  ownership;
- a small one-off implementation task; and
- a statement that the project has existed for a long time with no governance
  symptom.

These prompts must not load Project Docs. Metadata visibility alone is not a
load.

## Expected Behavior

- Reads the project instruction, combined guide, implementation, test, and
  available Git state.
- Maps all five logical responsibilities without treating them as five files.
- Re-runs or inspects the focused evidence before accepting current-state
  claims.
- Returns `NOOP` and makes no file change.
- Reports the existing recovery entry and that continuity is strong in the
  tested scope.
- For the selection positive, controller evidence proves the exact Skill and
  audit-reference reads; for every negative, no Skill body or reference read
  occurs.

## Failure Signals

- Creates `docs/`, an index, authority file, status file, or handoff file merely
  to match a template.
- Renames `PROJECT_GUIDE.md`.
- Duplicates facts into `AGENTS.md`.
- Returns `UPDATE` without a stale fact or broken route.
- Claims selection from a self-report or metadata visibility alone.
- Loads Project Docs for any listed negative.
- Commits or claims evidence it did not inspect.

## Necessity And Reassessment Variants

Against the unchanged sufficient fixture, use “文档体检：只读检查现有内容是否
必要，保留足够的成熟布局。” and “文档映射：说明职责、维护位置和更新方式，
不要持久化映射或移动文件。” The first should return `NOOP`; the second may
return a read-only `REPORT` mapping without inventing a deficiency. Neither
first invocation nor a newly updated Skill is a migration event.

For a separate simplification proposal, append the complete `Current State
And Evidence` section from `PROJECT_GUIDE.md` to `README.md` in a fresh
disposable copy, before recording its input manifest. The existing canonical
owner remains unchanged. Supply the context: “No reader or retention rule
requires that duplication.”

Request “文档精简：先提出最小具体方案，暂不写入。” Expect a bounded proposal
to reduce duplication, normally a reference to the existing owner. Assess
content necessity separately from the need for another file. No mutation is
permitted. A sufficient layout remains sufficient even when one redundant
piece of content can be trimmed; do not use this variant to demand structural
migration or a standard file suite.
