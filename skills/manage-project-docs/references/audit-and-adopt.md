# Audit And Adopt

Use this reference to map existing documentation, assess content and file
necessity, adopt missing responsibilities, or propose structural change.

## Selection And Mutation Authority

Implicit selection is appropriate for a direct project-document governance
request or high-confidence evidence that authority, canonical routing,
evidence, or recovery is missing or contradictory. Selection alone permits
only bounded read-only inspection and a visible proposal; applicable write
authorization remains valid. When a symptom is
incidental to another task and does not block that task, do not expand into a
full audit; name the concern and offer the smallest useful Project Docs check.

Follow the authorization rule in `SKILL.md`: explain concrete effects not yet
approved, and reuse valid approval without repeating it. First invocation,
installation, or prior adoption is not permission to persist a map or migrate
an existing project. Mapping may be read-only; simplification changes content
or layout and needs authorization for those effects.

## Build The Responsibility Map

Inventory the user-specified object and question within the nearest applicable
project scope. Follow necessary rules, evidence, owners, and direct consumers;
map only the responsibilities relevant to that question. Use all five for an
overall audit, first adoption, or demonstrated broad scope/routing failure.
Do not infer a project-wide deficiency from an uninspected responsibility.

| Responsibility | Answer when relevant |
|---|---|
| Purpose and scope | What is this project or scope for, and what is excluded? |
| Work and verification | How is work performed and proved? |
| Authority and write routing | Where is each durable fact read, and where is it canonically written? |
| Current state and evidence | What is true now, and what evidence supports it? |
| Next action and recovery | Where and how does a later session resume? |

| Field | Record |
|---|---|
| Logical responsibility | One of the five minimum responsibilities |
| Read locations | Every source a reader is expected to consult |
| Canonical write locus | The single owner for normative durable facts |
| Update mode | How the relevant content or section is maintained |
| Evidence | Code, tests, runtime output, Git state, or external source |
| Confidence | Verified, partial, unverified, or `UNKNOWN` |
| Conflict | Competing claim, scope, lifecycle, or owner |

For an overall assessment, treat a repository with all five responsibilities
and usable routing as sufficient even when filenames, language, or grouping
differ from examples. Return `NOOP` if the inspected scope has no stale fact or
broken route to repair; do not claim that a local check verified the whole
repository.

## Assess Content And Independent-File Necessity

Ask two separate questions: does this content earn its maintenance cost, and
does it need its own file? Useful content can live in an existing section.
A distinct update cadence alone does not require a split when sections can
represent it clearly.

For the affected content, inspect its purpose, the reader's actual decision or
recovery need, existing authority owner, update trigger, maintenance cost, and
retention obligations. Check duplicates within the same file as well as across
files. A document's existence, length, or conventional name is not proof of
necessity; low use is not proof that required evidence can be discarded.

Choose the smallest useful recommendation:

| Recommendation | When it serves the reader |
|---|---|
| Keep | A distinct decision, contract, evidence, or retention need is already served well |
| Trim | Necessary content is obscured by repeated current facts or unnecessary narrative |
| Merge into an existing owner | Content remains needed but a separate file adds no useful responsibility or boundary |
| Reference | Another owner already maintains the fact; keep a link or bounded summary |
| Generate a view | An existing reliable source and generation mechanism can supply the needed view |
| Archive | Content is no longer current but history or a retention obligation still matters |

Recommend a split only when independent responsibility, audience, permission,
scope, ownership, or lifecycle cannot be served coherently in the existing
container. Explain the reader benefit and ongoing cost. Reuse existing
generators; do not build a general documentation platform for the audit.

Before deletion, identify the exact content or file, inbound references,
remaining responsibilities, history and retention obligations, and the
authorization covering removal. If retention is unresolved, propose keeping
or archiving it. Do not delete merely because a newer document exists.

## Choose Owners And Update Modes

For first adoption, understand the layout and missing responsibilities before
proposing files. A combined owner can suffice. For an existing project, map
current documents and external sources; the following modules are examples,
not a file list or automatic migration.

Activate a module by following this chain:

```text
material project event -> durable fact class -> existing canonical owner -> update mode
```

Update an existing owner when it can still serve the fact coherently. Propose
a separate module only when the fact needs an independent lifecycle, update
mode, owner, audience, scope, or historical record that the current owner
cannot represent safely, including through separate sections.

| Functional module | Activate or revisit when | Default update mode |
|---|---|---|
| Purpose and scope | first adoption or an accepted product or scope change | revise the current contract; preserve durable rationale in a decision record when needed |
| Work and verification | a repeatable work method, acceptance rule, or check exists or changes | revise the current method; record time-bound results in the evidence owner |
| Authority and routing | more than one owner, scope, generated source, or external source must be navigated, or a route changes | revise the current map only after structural or owner authorization |
| Current state and recovery | work spans sessions, pauses, transfers, or changes writer, gate, next action, or recovery target | replace one coherent current snapshot; keep execution history elsewhere |
| Decisions | a non-obvious durable tradeoff or replacement needs rationale | preserve frozen rationale; record the successor and its scope in the current entry |
| Evidence and results | a claim depends on repeatable checks, current acceptance, or comparison with older results | retain frozen results, add a bounded successor or correction, and update the current index |

Generated projections are updated through their editable source and then
regenerated. Externally owned facts are updated in that system; when it is
unavailable, retain the mapping and report the fact as unverified or `UNKNOWN`.
Use [Maintain And Recover](maintain-and-recover.md#choose-update-modes-by-content)
for mixed documents and partial replacement, invalidity, and applicability.

## Classify Claims Before Resolving Them

Keep these classes separate:

1. intended contract;
2. actual implementation;
3. current work state;
4. verification evidence;
5. historical decision and rationale.

Prefer direct evidence for current behavior, but do not silently replace an
accepted contract. Record a mismatch and preserve `UNKNOWN` when the available
sources cannot resolve it.

## Audit Or Repair

1. Confirm whether the request is read-only or permits updates to existing
   canonical owners.
2. Read declared precedence and ownership before choosing a winner.
3. Identify stale duplicates, missing routes, and facts without a write locus.
4. Check the applicability of time-bound claims and evidence, any invalidity
   or replacement relationship, and whether the current entry points to the
   applicable owner. A newer date alone cannot settle these questions.
5. Check that the stated next action stays within the current gate and
   authorization, and that a fresh reader can identify one trustworthy
   recovery entry.
6. Apply the primary outcome rules in `SKILL.md`. A completed read-only audit
   remains `REPORT` when only a later write is blocked; any proposed structure
   or authority change remains `PROPOSE`.

Do not make a structural repair merely because it is obvious or reversible.
Documents can exist and still fail the minimum contract when their routes do
not yield one trustworthy recovery entry. If repair requires an unapproved
new owner, route, or authority choice, return `PROPOSE` instead of
treating it as routine content maintenance.

Do not modify, relabel, or silently reinterpret an immutable historical
artifact such as a tagged snapshot, archived report, signed record, or frozen
release note. Correct or downgrade the current claim in its canonical owner
and point to a later corrected revision while preserving the historical fact.

## First Adoption

1. Inspect the existing layout and gaps; verify explicit authorization for the
   concrete target-project effects. If missing, present the smallest proposal
   and obtain approval. If already given, proceed within it.
2. Reuse existing sources for every responsibility they already satisfy.
3. Add only the missing routing or content.
4. Prefer one combined project document when it is clearer than several empty
   owners. Use the [single-file Starter](../assets/templates/project-doc-starter.md)
   only as an adaptable starting point.
5. If persistent continuity is authorized, merge the
   [Continuity Anchor](../assets/templates/continuity-anchor.md) into the
   existing project instruction or governance entry.
6. Verify that a fresh reader can locate all five responsibilities without
   knowing the template names.

## Structural Expansion

Propose expansion only after a concrete event shows that the current routing is
insufficient, such as:

- a new independently governed subproject or monorepo scope;
- incompatible owners or update needs that sections cannot safely express;
- repeated conflicts caused by one file owning unrelated facts;
- one responsibility dispersed across sources without a clear write locus;
- a rename, migration, generator, or external owner changing edit location;
- a durable interface, security, operational, or evidence domain becoming too
  large for its current owner.

Project age, file count, or a generic desire for "better docs" is not an
activation event. Keep a combined owner when different facts still share one
scope, owner, audience, and update lifecycle.

State the user-visible benefit, affected owners, migration path, compatibility
links, verification, and rollback before requesting authorization. Do not
represent this as a maturity-level upgrade.

## Special Sources

- Generated documentation: locate and edit the generator input; report the
  generated file as derived.
- External Wiki or issue tracker: allow it to own a fact; when unavailable,
  retain the mapping and mark the fact unverified.
- Monorepo: use the nearest applicable instruction and responsibility map;
  avoid promoting subproject facts into a root owner.
- Multilingual docs: preserve the established language and canonical owner;
  do not create translation/version publishing machinery.
