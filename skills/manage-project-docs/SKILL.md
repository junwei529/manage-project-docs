---
name: manage-project-docs
description: Audit, adopt, repair, and maintain repository project-document governance so humans and coding agents can find authoritative scope, working rules, current evidence, and recovery state. Use for a direct project-document governance, audit, adoption, handoff, or recovery request, or when high-confidence symptoms show missing, conflicting, duplicated, stale, generated, externally owned, or hard-to-resume authority, evidence, or routing. Implicit selection permits only the minimum bounded read-only inspection and a visible proposal; it never authorizes first adoption, persistence, structural or canonical-owner change, or any write. Routine updates already covered by valid project routing should proceed without this Skill. Preserve sufficient mature layouts, and do not use for ordinary prose or README editing, generated-output formatting, a small one-off task, project longevity alone, or Work Charter or PowerShell concerns without a documentation-governance symptom.
---

# Manage Project Docs

Maintain reliable project truth without imposing a fixed file suite.

Project Docs may be selected implicitly for a direct governance request or a
high-confidence governance failure. Selection authorizes no mutation. Perform
only the minimum safe read-only inspection needed to show the routing problem
and a concrete proposal. `$manage-project-docs` is the unambiguous manual
invocation token; the UI display name is **Project Docs**. Neither form grants
write authority.

Project Docs, Work Charter, and Use PowerShell Safely are independent catalog
peers. Project Docs owns documentation-governance semantics, Work Charter owns
consequential-work coordination, and Use PowerShell Safely owns material
Windows shell, native-process, encoding, path, permission, and WSL boundaries.
One peer's selection, body load, or authority never selects another peer or
grants it read, write, Git, installation, or external-effect authority.

## Workflow

1. Establish the target scope, requested outcome, whether the Skill was
   implicitly selected or manually invoked, write permission, current writer,
   and whether structural change is authorized. Treat a reader, an active
   session, and the current writer as separate facts. A read-only audit may
   continue while other sessions are active.
2. Follow the applicable project instructions already loaded by the Harness
   and inspect the existing navigation, relevant code, tests, Git state, and
   external evidence. Do not infer current behavior from prose alone.
3. Map existing sources to five logical responsibilities:

   | Responsibility | Required answer |
   |---|---|
   | Purpose and scope | What is this project or scope for, and what is excluded? |
   | Work and verification | How is work performed and proved? |
   | Authority and write routing | Where is each durable fact read, and where is it canonically written? |
   | Current state and evidence | What is true now, and what evidence supports it? |
   | Next action and recovery | Where and how does a later session resume? |

4. Classify the surface:
   - read-only discovery or audit, whether implicit or manually invoked;
   - first adoption;
   - routine maintenance under an existing project rule, which normally does
     not require this Skill; or
   - structural repair, expansion, or migration.
5. Load only the detailed reference needed:
   - read [Audit And Adopt](references/audit-and-adopt.md) for inventory,
     conflicts, missing responsibilities, first adoption, or structural change;
   - read [Maintain And Recover](references/maintain-and-recover.md) for a
     focused durable update, continuity, pause, handoff, or recovery;
   - use both only when adoption also needs a recovery entry.
6. Before every persistent write, state the concrete visible effects: target
   files, fact classes, and any structural or canonical-owner change. Obtain
   explicit natural-language authorization for those exact effects. A direct
   request or later confirmation may satisfy this only when the effects are
   unambiguous. Re-confirm write authority and the current writer immediately
   before mutation.
7. End with one primary outcome:
   - `NOOP` when the existing system is sufficient;
   - `REPORT` for read-only findings that need no structural or authority
     decision;
   - `UPDATE` for an authorized change to an existing canonical owner;
   - `PROPOSE` when structure or authority needs approval, even if the current
     audit is read-only;
   - `STOP` when permission, writer ownership, scope, or evidence is unsafe.
     Use `STOP` only when the requested action itself cannot continue safely;
     a completed read-only audit remains `REPORT` even when a later write is
     blocked.
8. Verify links, status and evidence claims, recovery routing, placeholders,
   generated-source ownership, and publication safety. After any command that
   may write, reconcile the actual target file and Git state, including
   generated, ignored, and untracked artifacts.
9. Report the outcome, inspected scope, every actual file change, changed
   canonical owners, unresolved facts, continuity strength, and exact recovery
   entry. Use only `strong`, `weak`, or `not applicable` for continuity.
   `Strong` requires a verified durable anchor and recovery path with no known
   permission, writer, routing, or required-owner block; report `weak` when
   recovery was assessed and any such block remains.

## Canonical Write Rule

Allow several read locations, but keep one canonical write locus for each
normative durable fact within one scope and lifecycle. Link or summarize
elsewhere instead of copying the full fact.

Distinguish intended contract, actual implementation, current work state,
verification evidence, and historical rationale. Preserve `UNKNOWN` when those
sources do not resolve a conflict.

## Output Assets

- Use the [single-file Starter](assets/templates/project-doc-starter.md) only
  when an authorized first adoption is missing several responsibilities and
  one combined document is the smallest coherent result.
- Use the [Continuity Anchor](assets/templates/continuity-anchor.md) only when
  the user authorizes a persistent target-project rule. Merge it into the
  project's existing instruction or governance entry and replace every
  placeholder with actual routing.

Assets are adaptable output resources, not mandatory filenames. Do not copy
facts from this Skill repository into a target project.

## Boundaries

- Follow the target project's declared authority and canonical write routing.
- Treat audit as read-only unless the request separately authorizes an update.
- Treat implicit selection, metadata visibility, body loading, installation,
  prior use, and a project-rule mention as neither write authorization nor
  structural authorization.
- Require explicit authorization for first adoption, new modules, split, merge,
  rename, migration, authority changes, and canonical-owner changes.
- Preserve a sufficient mature layout and return `NOOP`; do not upgrade named
  maturity levels or create a parallel documentation tree.
- Stop before writing when another writer's ownership is unresolved.
- With no write permission, return `REPORT` or `PROPOSE`.
- Edit the source of generated documentation, not the generated output.
- Treat an unavailable external source as unverified.
- Use the nearest applicable scope in a monorepo and preserve the project's
  existing document language.
- Persist continuity in target-project sources, not chat, private memory,
  discovery mappings, installed Skill copies, or caches.
- Do not poll conversations, run a background scan, or preload the Skill on
  every task. Valid target-project routing owns ordinary maintenance; broken
  routing may re-enter only bounded proposal behavior.
- Do not modify Git history, commit, push, merge, or clean a worktree unless separately authorized.
- Do not publish secrets, private paths, task identifiers, raw logs, hidden reasoning, or personal environment details.
- Do not activate the large-task workflow merely because project documentation is being updated.
