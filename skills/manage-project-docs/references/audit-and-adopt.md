# Audit And Adopt

Use this reference to discover an existing documentation contract, repair
authority drift, adopt a project, or propose structural change.

## Selection And Mutation Authority

Implicit selection is appropriate for a direct project-document governance
request or high-confidence evidence that authority, canonical routing,
evidence, or recovery is missing or contradictory. It authorizes only the
minimum bounded read-only inspection and a visible proposal. When a symptom is
incidental to another task and does not block that task, do not expand into a
full audit; name the concern and offer the smallest useful Project Docs check.

`$manage-project-docs` is the manual invocation token and **Project Docs** is
the UI name. Neither is a write token. Before first adoption, persistence, any
write, module activation, or any structural, authority, or canonical-owner
change, present the exact proposed targets and visible effects. A user's
unambiguous natural-language request or confirmation is sufficient only for
those listed target-project effects. Installation, selection, body loading,
prior adoption, or a routing mention do not propagate write, Git,
external-action, or cross-Skill authority.

## Build The Responsibility Map

Inventory the nearest applicable project scope before deciding on files.

| Field | Record |
|---|---|
| Logical responsibility | One of the five minimum responsibilities |
| Read locations | Every source a reader is expected to consult |
| Canonical write locus | The single owner for normative durable facts |
| Evidence | Code, tests, runtime output, Git state, or external source |
| Confidence | Verified, partial, unverified, or `UNKNOWN` |
| Conflict | Competing claim, scope, lifecycle, or owner |

Treat a repository with all five responsibilities and usable routing as
sufficient even when filenames, language, or grouping differ from examples.
Return `NOOP` if there is no stale fact or broken route to repair.

## Choose Modules And Update Modes

For a new project without reliable owners, start with the five logical
responsibilities in one combined document when that is sufficient. For an
existing project, map its current documents and external sources; do not force
this module list or its grouping onto the project.

Activate a module by following this chain:

```text
material project event -> durable fact class -> existing canonical owner -> update mode
```

Update an existing owner when it can still serve the fact coherently. Propose
a separate module only when the fact needs an independent lifecycle, update
mode, owner, audience, scope, or historical record that the current owner
cannot represent safely.

| Functional module | Activate or revisit when | Default update mode |
|---|---|---|
| Purpose and scope | first adoption or an accepted product or scope change | revise the current contract; preserve durable rationale in a decision record when needed |
| Work and verification | a repeatable work method, acceptance rule, or check exists or changes | revise the current method; record time-bound results in the evidence owner |
| Authority and routing | more than one owner, scope, generated source, or external source must be navigated, or a route changes | revise the current map only after structural or owner authorization |
| Current state and recovery | work spans sessions, pauses, transfers, or changes writer, gate, next action, or recovery target | replace one coherent current snapshot; keep execution history elsewhere |
| Decisions | a non-obvious durable tradeoff or supersession needs rationale | append a new record or explicit supersession; do not rewrite accepted history |
| Evidence and results | a claim depends on repeatable checks, current acceptance, or comparison with older results | append or supersede a bounded result, label its time scope, and keep the current index accurate |

Generated projections are updated through their editable source and then
regenerated. Externally owned facts are updated in that system; when it is
unavailable, retain the mapping and report the fact as unverified or `UNKNOWN`.

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
4. Check whether time-bound claims and evidence are labeled `current`,
   `historical`, or `superseded`, and whether a results index points to the
   current canonical evidence owner rather than presenting an older result as
   current.
5. Check that the stated next action stays within the current gate and
   authorization, and that a fresh reader can identify one trustworthy
   recovery entry.
6. Apply the primary outcome rules in `SKILL.md`. A completed read-only audit
   remains `REPORT` when only a later write is blocked; any proposed structure
   or authority change remains `PROPOSE`.

Do not make a structural repair merely because it is obvious or reversible.
Documents can exist and still fail the minimum contract when their routes do
not yield one trustworthy recovery entry. If repair requires a new owner,
route, or authority choice, fail closed and return `PROPOSE` instead of
treating it as routine content maintenance.

Do not modify, relabel, or silently reinterpret an immutable historical
artifact such as a tagged snapshot, archived report, signed record, or frozen
release note. Correct or downgrade the current claim in its canonical owner
and point to a later corrected revision while preserving the historical fact.

## First Adoption

1. Complete a read-only responsibility and module map, then obtain explicit
   authorization for the concrete target-project structural writes.
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
- incompatible update cadences or owners;
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
