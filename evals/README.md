# Project Docs Evaluations

The five retained case definitions preserve their independent source lineage
from `80910a8b2375a11be897e9660c4b00a06d00dd13`. The added learning/reuse case
extends the maintenance and mature-noop scenarios with synthetic operating inputs.
Existing fixtures remain exact Git blobs; setup/inspection scripts retain their
mapped compatibility rewrites. This surface imports no other Skill or former
monorepo evaluation envelope.

## Cases

- [`project-docs-adopt.md`](cases/project-docs-adopt.md)
- [`project-docs-conflict.md`](cases/project-docs-conflict.md)
- [`project-docs-continuity.md`](cases/project-docs-continuity.md)
- [`project-docs-mature-noop.md`](cases/project-docs-mature-noop.md)
- [`project-docs-safety-boundaries.md`](cases/project-docs-safety-boundaries.md)
- [`project-docs-learning-reuse.md`](cases/project-docs-learning-reuse.md)

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
the retained five groups; the added learning/reuse group defines its own synthetic inputs. Use fresh disposable fixture copies for independent
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
[the refactor verification](../docs/skills/manage-project-docs/VERIFICATION.md#project-knowledge-maintenance-refactor).
The [v0.4.3 delivery evidence](../docs/skills/manage-project-docs/VERIFICATION.md#v043-delivery)
is retained as historical evidence only.
