# Project Docs Design

## Product boundary

Audits, adopts, maintains, and recovers project documentation without inventing authority. The canonical installable source is
[`skills/manage-project-docs/`](../../../skills/manage-project-docs/). All six
package files are independent normalized-text rewrites retaining their source
identities from `80910a8b2375a11be897e9660c4b00a06d00dd13`.

The repository owns one Skill product. Cross-Skill composition is optional and
cannot grant authority or create a hard dependency.

## Package contract

The package contains exactly 6 files. `SKILL.md` owns
selection and entry behavior; directly linked references and assets own detailed
guidance and templates. The repository checker fails if any package byte or
expected path differs from the recorded baseline mapping.

The five logical responsibilities and single canonical write locus remain the
shared contract. They do not prescribe filenames. Content necessity and the
need for an independent file are separate judgments based on reader decisions,
existing ownership, update triggers, maintenance cost, and retention duties.
Mature layouts stay in place when sections and references suffice.

Update modes belong to content or major sections: current snapshots, approved
contracts, frozen history/results, and derived views can share a file.
Replacement (including partial replacement), invalidity, and current
applicability are separate relationships; dates alone do not settle them.
Documentation impact starts from changed durable facts and checks bounded
actual consumers, including duplicates in one file and files outside the diff.

Selection grants no write authority and revokes none. A clear direct request
or concrete approval can cover continuous completion of the corresponding
scope. Verify effects, actual targets, and writer facts before mutation;
resolve new scope, permissions, external effects, or writer conflicts instead
of repeatedly asking for the same authorized work. Natural-language intent
phrases are optional; ordinary maintenance follows existing project routing.

## Package Responsibility Map

| Source | Maintained responsibility |
|---|---|
| `SKILL.md` | Selection, shared principles, authorization/outcome rules, and routing |
| `references/audit-and-adopt.md` | Content/file necessity, mapping, first adoption, and structural proposals |
| `references/maintain-and-recover.md` | Section lifecycles, mixed-document examples, consumer impact, and recovery |
| `assets/templates/project-doc-starter.md` | Adaptable combined owner with update modes and exceptions |
| `assets/templates/continuity-anchor.md` | Persistent routing without copied current facts or repeated approvals |
| `agents/openai.yaml` | Request-sensitive default prompt and retained implicit-invocation policy |

These are the existing package files, not a target-project documentation suite.
There is no new governance platform, generic executor, or per-task full audit.

## Evaluation surface

- `evals/cases/project-docs-adopt.md`
- `evals/cases/project-docs-conflict.md`
- `evals/cases/project-docs-continuity.md`
- `evals/cases/project-docs-mature-noop.md`
- `evals/cases/project-docs-safety-boundaries.md`

Cases are independent normalized-text rewrites; retained fixtures remain exact
source blobs. Setup/inspection scripts retain their existing mapped standalone
compatibility adaptations. Case-local input variants cover
mixed maintenance, duplicate facts, consumers outside the diff, legitimate
history, partial replacement, approved pending work, and authorization
continuity/new effects. They define expected boundaries, not executed behavior
evidence; model runs, installation, and release remain separately authorized.

## Standalone constraints

- No other Skill package is included.
- Verification uses only repository-local files and standard host tools.
- Source provenance is explicit in [`../../../provenance/source-map.json`](../../../provenance/source-map.json).
- Historical monorepo state is not a runtime dependency or acceptance condition.
