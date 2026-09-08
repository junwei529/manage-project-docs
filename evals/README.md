# Project Docs Evaluations

The five case definitions are independent normalized-text rewrites retaining
source identity from `80910a8b2375a11be897e9660c4b00a06d00dd13`. Fixtures remain
exact Git blobs; setup/inspection scripts retain their mapped standalone
compatibility rewrites unchanged. This repository-local surface
does not import another Skill or the former monorepo evaluation envelope.

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

## Case-Local Variants

The case files define small additional inputs and expected boundaries within
the same five groups. Use fresh disposable fixture copies for independent
variants; apply only the stated input changes before freezing the input
manifest. Retained fixtures stay unchanged. Use the existing setup/inspection
helpers where applicable; no new evaluator is required. Do not run these model
scenarios without separate authorization, or report their definitions as passes.

The setup helper initializes, stages, and commits a disposable fixture baseline;
its inspection helper compares against that baseline. Those effects are not
part of source-only validation. For a later authorized variant run, record the
post-variant input manifest as well: the helper's original fixture baseline
alone cannot distinguish prepared variant inputs from agent-produced changes.

Coverage and current evidence limits are mapped in
[Verification](../docs/skills/manage-project-docs/VERIFICATION.md#current-source-validation).
