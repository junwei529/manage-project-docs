# Project Docs

[English](README.md)

让项目文档跟得上项目。

Project Docs 是面向 Codex 的项目文档治理 Skill。它帮助你判断哪些内容值得维护、事实应该在哪里维护，以及项目变化后哪些文档需要同步。
目标是让人和 AI 都能找到当前可信的信息，同时控制文档数量和维护成本。

## 它能帮助你

- **判断文档是否必要。** 从读者需要作出的决定出发，判断哪些内容应当补充、保留、合并或精简。
- **减少重复维护。** 为同一事实明确主要维护位置，让其他文档通过引用或必要摘要保持关联，并保留已有的合理结构。
- **让变化得到同步。** 区分当前状态、长期约定和历史结论，在事实改变时找到受影响的文档与引用。

## 一个使用场景

README 说某项功能已经完成，计划文档仍把它列为待办，历史报告又保留着早期限制。
Project Docs 会帮助你核对这些内容各自的用途与依据：哪些描述当前状态，哪些保存历史，哪些确实需要修正。随后给出具体的维护建议，并在获准范围内完成更新。

## 日常使用

安装后，可以直接表达你的意图：

- **文档初始化：** 检查现有布局，提出必要的最小补充。
- **文档体检：** 检查内容是否必要、过时或相互矛盾。
- **文档映射：** 说明不同信息在哪里维护、何时更新。
- **文档精简：** 找出可以合并、引用或归档的重复内容。

也可以明确调用：

```text
$manage-project-docs
检查这个项目的文档是否重复、过时或相互矛盾。
先给出问题和具体调整建议，保留已经合理的结构。
```

检查可以围绕一个局部问题展开；日常维护沿项目已有规则进行。

进一步了解：[设计说明](docs/skills/manage-project-docs/DESIGN.md) / [验证范围](docs/skills/manage-project-docs/VERIFICATION.md) / [评估场景](evals/README.md)。

<details>
<summary>安装、版本与验证说明</summary>

本仓库独立维护六文件 [`manage-project-docs` 包](skills/manage-project-docs/)。
[当前源码候选](docs/skills/manage-project-docs/STATE.md#current-implementation)
与安装副本、历史公开发布分别记录。当前包和案例定义采用保留原始
[来源身份](PROVENANCE.md)的独立 normalized-text 改写。

自然语言入口表达意图，不授予写权限。有效的具体授权连续适用于其范围，不要求逐文件重问。
“重新检查”等同义表达也从完整请求判断是只读报告还是完成已授权修改。从指定对象和问题
出发，追踪必要的 owner、规则、证据与直接消费者，按任务加载所需 reference。
普通“同步文档”“更新 README”沿有效项目路由完成，不要求每次加载 Skill。

## 仓库内容

- 产品包：[`skills/manage-project-docs/`](skills/manage-project-docs/)
- 产品设计与状态：[`docs/skills/manage-project-docs/`](docs/skills/manage-project-docs/)
- 评估 case 与 fixture：[`evals/`](evals/README.md)
- 独立验证：[`scripts/check_repository.py`](scripts/check_repository.py)
- 来源映射：[`PROVENANCE.md`](PROVENANCE.md) 与
  [`provenance/source-map.json`](provenance/source-map.json)

## 验证

```powershell
python -B scripts/check_repository.py --json
```

本仓库不隐式依赖其他 Skill 仓库。本地检查不证明模型行为或安装。迁移快照仍只证明来源 provenance；独立
`v0.3.0` 公开 Release 与 installed-copy 证据记录在下文和
[`STATE.md`](docs/skills/manage-project-docs/STATE.md) 中。

## 独立 v0.3.0 发布生命周期

公开身份是 `junwei529/manage-project-docs`。首个独立 `v0.3.0` Release 延续
legacy 公开版本线 `junwei529/skills@v0.2.0`，但精确六文件包来自更晚的源
commit `80910a8b2375a11be897e9660c4b00a06d00dd13`，并非与 `v0.2.0` tag
字节一致。公开 tag `v0.3.0` 绑定 release commit P
`02a1494e7dd22f9b598b752057c792aa3b2e3ae2`。

Release notes 是必须经过人工审阅的发布产物。公开 `v0.3.0` Release 使用精确获批的
标题和正文，说明 legacy `v0.2.0` lineage、`v0.2.0` 之后的包差异、不可变
P、所含六文件 Skill 包、已执行验证、兼容性限制，以及尚未闭合的证据边界。

生命周期路线只使用不可变 commit：

1. **安装：**公开 `v0.3.0` tag 与 Release 存在后，记录经审阅 Release 解析出的精确 commit。调用已安装的 `$skill-installer` helper，指定 `junwei529/manage-project-docs`、`--ref <release-commit>` 和 `--path skills/manage-project-docs`。helper 安装到 `$CODEX_HOME/skills/manage-project-docs`；若目标已存在则中止。
2. **验证：**将已安装六文件包的清单和 SHA-256 与 `<release-commit>` 中的包逐项比较，然后新建一个 cold Codex task。在该 task 中，把实际 loaded copy 的六文件清单和 hash 绑定到 `<release-commit>`，并执行适用的 installed-copy 行为证明后才可接受安装。安装 task 内的后续 turn 不足以满足该证明，也不得把 SOURCE 资格验证当作 installed-copy 证明。
3. **更新：**先把 live 清单和 hash 与其已记录 installed commit 比较；存在本地改动时，停止并明确决定保留、迁移或丢弃。把新的已审阅 Release 解析到不可变 commit，使用 `--dest` 安装到全新 staging 并验证，再单独授权同一文件系统交换：live 改名为 rollback backup，staged 改名为 `$CODEX_HOME/skills/manage-project-docs`。第二次改名失败时立即恢复 backup；恢复失败时保留所有幸存路径并停止等待 recovery。交换成功后，新建一个 cold Codex task；在该 task 中，把实际 loaded copy 的六文件清单和 hash 绑定到新的不可变 commit，并执行适用的 installed-copy 行为证明后才可接受更新。激活或验证失败时，先把失败 live 移到唯一 evidence path，再恢复 backup；任一移动或恢复失败时保留全部路径并停止等待 recovery。恢复完成后，再新建一个 cold Codex task，把实际 loaded 的恢复副本绑定到已记录的上一个 commit，并重新执行适用的 installed-copy 行为证明；若仍失败，则保留 recovery 状态并停止。backup 与失败副本证据保留到验收完成。不得原地覆盖既有目标。
4. **卸载：**取得单独授权后，验证精确的目标 user-installation path，把清单和 hash 绑定到已记录 installed commit，记录是否存在本地改动，并记录其 former live path 与 discovery/load origin；目录有改动或身份不明确时停止。在同一文件系统内，把该 live Skill 目录改名到所有 Skill discovery root 之外的唯一 quarantine path，不得递归删除。新建一个 cold Codex task，证明被 quarantine 的精确 target origin 不再被发现或加载后才可接受卸载。已分别识别的 project、admin 或 system scope 同名副本可以继续存在，不会使该 origin-aware proof 失败。无法可靠排除 target origin 时，卸载保持 `UNKNOWN`，并在安全时恢复 quarantine 副本；改名、证明或恢复有歧义或失败时，保留所有路径并停止等待 recovery。永久删除 quarantine 副本是卸载接受后的另一个单独授权 cleanup 效果；删除失败不会抹除可恢复的卸载状态。
5. **回滚：**把上一个已接受的不可变 commit 安装到全新 staging 并验证，复用更新步骤中的本地改动预检、受限交换和失败恢复。新建一个 cold Codex task，把实际 loaded copy 的六文件清单和 hash 绑定到 rollback commit，并重新执行适用的 installed-copy 行为证明后才可接受回滚。rollback task 内的后续 turn 不足以满足该证明。

已批准的 B2 qualification 已执行精确 `v0.3.0` 发布、安装、更新、origin-aware
卸载/quarantine、恢复与 fresh-task loaded-copy 路线。任何后续替换、回滚、删除、
tag、Release 或发布仍是需要独立授权的效果。

Release closeout 严格区分三个身份：

- **C：**由 Planner 评估的不可变 B1 qualification candidate。C 提交后保持 `PENDING_PLANNER_ACCEPTANCE`，直到 Planner 对该精确 commit 和 tree 返回 `ACCEPTED`。
- **R：**后续 repo-local governance receipt commit。精确 C 被接受前禁止创建 R。R 可以记录 C、C 的 tree、verdict 和 evidence pointer，把 `LOCAL_RELEASE_READY` 从 `PENDING_PLANNER_ACCEPTANCE` 转为 `LOCAL_RELEASE_READY`，更新所需既有 hash/provenance consumer，并通过 clean post-commit repository checker。receipt 与 readiness transition 是 R 唯一允许的语义差异。R 不得改变 lifecycle instructions、package/evaluation/checker bytes、qualification criteria 或 meaning、evidence inputs 或 results、public-release identity 或 installed-copy claims；任何更广差异都必须停止并取得新的 acceptance disposition。
- **P：**不可变 public `v0.3.0` Release commit
  `02a1494e7dd22f9b598b752057c792aa3b2e3ae2`。其 parent 是 R，repository tree
  与 package tree 均与 R 相同。C 和 R 均不是 P，后续 evidence commit 不得移动
  tag `v0.3.0`。

`PUBLIC_RELEASE` 为 `PUBLISHED`。`STABLE_INSTALLED_COPY` 为
`VERIFIED`。广义 `EFFICACY_BOUNDARY` 与未测试上下文
继续保持 `UNKNOWN`。

</details>
