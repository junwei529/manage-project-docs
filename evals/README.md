# Project Docs Evaluations

These retained cases and fixtures are exact Git blobs from source commit
`80910a8b2375a11be897e9660c4b00a06d00dd13`. They define the repository-local evaluation surface without
importing another Skill or the former monorepo evaluation envelope.

## Cases

- [`project-docs-adopt.md`](cases/project-docs-adopt.md)
- [`project-docs-conflict.md`](cases/project-docs-conflict.md)
- [`project-docs-continuity.md`](cases/project-docs-continuity.md)
- [`project-docs-mature-noop.md`](cases/project-docs-mature-noop.md)
- [`project-docs-safety-boundaries.md`](cases/project-docs-safety-boundaries.md)

## Fixtures

- [`project-docs-adopt`](fixtures/project-docs-adopt/)
- [`project-docs-conflict`](fixtures/project-docs-conflict/)
- [`project-docs-continuity`](fixtures/project-docs-continuity/)
- [`project-docs-mature-noop`](fixtures/project-docs-mature-noop/)
- [`project-docs-safety-boundaries`](fixtures/project-docs-safety-boundaries/)

## Deterministic verification

Run `python -B scripts/check_repository.py --json` from the repository root.
Case execution that invokes a model, installs a Skill, or uses an external
provider remains a separately authorized evidence action.
