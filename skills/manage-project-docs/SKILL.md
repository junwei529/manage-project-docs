---
name: manage-project-docs
description: Assess project-document necessity, authority, update modes, and recovery; audit, adopt, simplify, or maintain existing documentation. Use for a direct governance request (including 文档初始化, 文档体检, 文档映射, or 文档精简 in context) or clear necessity, authority, freshness, duplication, or recovery problems involving existing, generated, or external documentation. Selection alone permits bounded read-only inspection and a proposal; it grants no writes and does not cancel valid authorization. Ordinary maintenance follows valid project routing without loading this Skill. Preserve sufficient mature layouts. Do not select merely for prose or README edits, generated-output formatting, a small task, project age, or another Skill's concerns without a documentation-governance need.
---

# Manage Project Docs

Maintain useful project truth with the least necessary duplicate maintenance.
Five logical responsibilities do not require five files. Assess whether content
is needed separately from whether it needs an independent file; a file may
contain sections with different update modes.

Project Docs may be selected implicitly for a direct governance request or a
high-confidence governance failure. Selection alone authorizes no mutation;
without a separate applicable write authorization, inspect only enough to show
the problem and a concrete proposal. Selection does not revoke an existing
authorization to complete that scope. `$manage-project-docs` is the explicit
manual entry; the UI display name is **Project Docs**. Neither is a write token.

When selected implicitly, make that selection visible before Skill-guided
work: name Project Docs, state the governance reason, and identify which effects
are already authorized and which remain proposals. When another Skill is also
applicable, present each peer's role and authority separately.

Project Docs, Work Charter, and Use PowerShell Safely are independent catalog
peers. Project Docs owns documentation-governance semantics, Work Charter owns
consequential-work coordination, and Use PowerShell Safely owns material
Windows shell, native-process, encoding, path, permission, and WSL boundaries.
One peer's selection, body load, or authority never selects another peer or
grants it read, write, Git, installation, or external-effect authority.

## Start With The Request

Interpret the complete request: identify the object and question, the requested
outcome, and applicable authorization before choosing the reading scope.
Optional phrases such as 文档初始化, 文档体检, 文档映射, and 文档精简 describe
intent, not operation codes or permission tokens. “重新检查” is another natural
request: “重新检查这段状态与已有证据是否一致，先只读” asks for a bounded
report; “重新检查并完成已批准的这项文档修正” retains that approval's scope.

Start with the affected content and follow the rules, canonical owners,
evidence, and direct consumers needed to answer the question. A named file is
not a reason to omit those dependencies, nor does a local question require an
audit of every responsibility. Build a proportionate full map for an overall
audit, first adoption, or evidence of broadly unreliable scope or routing.

Load the detailed reference that the task needs:

- [Audit And Adopt](references/audit-and-adopt.md): necessity, responsibility
  mapping, simplification, missing responsibilities, or structural change.
- [Maintain And Recover](references/maintain-and-recover.md): an authorized
  durable update, mixed content, documentation impact, or recovery.
- Use both when both kinds of judgment are needed; unrelated procedures do
  not become required just because the Skill was loaded.

## Workflow

1. Establish the target scope, requested outcome, whether the Skill was
   implicitly selected or manually invoked, write permission, current writer,
   and whether structural change is authorized. Treat a reader, an active
   session, and the current writer as separate facts. A read-only audit may
   continue while other sessions are active.
2. Follow the applicable project instructions already loaded by the Harness.
   Within the reading scope above, inspect relevant navigation, code, tests,
   Git state, and external evidence; map the responsibilities needed for the
   question. Do not infer current behavior from prose alone.
3. Classify the surface:
   - read-only discovery or audit, whether implicit or manually invoked;
   - first adoption;
   - routine maintenance under an existing project rule, which normally does
     not require this Skill; or
   - structural repair, expansion, or migration.
4. Before writing, verify the authorized effects, actual targets, scope, and
   current writer. A clear direct request or approval of a concrete proposal
   can authorize continuous completion of that scope, including necessary
   consumer updates. This is a fact check, not a new approval question per file
   or step. First adoption and structural or canonical-owner changes require
   explicit authorization of their concrete effects; reuse it when already
   given. Stop the affected action for new scope, permissions, external effects,
   or unresolved writer conflict, and obtain the missing disposition.
5. End with one primary outcome:
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
6. Within the affected scope, verify links, status and evidence claims, recovery
   routing, placeholders, generated-source ownership, and publication safety. After any command that
   may write, reconcile the actual target file and Git state, including
   generated, ignored, and untracked artifacts.
7. Report the outcome, inspected scope, every actual file change, changed
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

Choose update modes by content or section: revise current contracts within
approval, replace coherent current snapshots, preserve frozen history and add
successors or corrections, and update derived content at its true source.
Newer dates alone do not establish replacement, invalidity, or applicability.
Trace changed durable facts to their owners and bounded actual consumers,
including consumers outside the diff and duplicate current facts in one file.

## Natural-Language Use

Examples of the request-sensitive entry above:

- “文档初始化：先看已有布局，提出缺失职责的最小补充。” Inspect before
  proposing first adoption; complete the concrete persistent rules once authorized.
- “文档体检：只读检查内容是否必要、是否过时。” Report findings and options.
- “文档映射：说明职责、维护位置和更新方式，不移动文件。” A map may be a
  read-only response; persisting it needs applicable authorization.
- “文档精简：先提出合并、引用或归档建议。” Propose specific content/layout
  effects; implement them when authorized.

An existing project does not migrate because this Skill is first invoked or
updated. “同步文档” and “更新 README” are ordinary maintenance language; follow
valid project routing without loading this Skill unless context shows a
governance need. Reassessment may remain a read-only map and recommendation.

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
  rename, migration, authority changes, and canonical-owner changes; do not ask
  again when the concrete effects are already authorized.
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
