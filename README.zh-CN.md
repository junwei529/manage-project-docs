# Project Docs

[English](README.md)

本仓库是 `manage-project-docs` 的独立本地产品仓库。可安装包位于
[`skills/manage-project-docs/`](skills/manage-project-docs/)，其字节与源提交
`80910a8b2375a11be897e9660c4b00a06d00dd13` 完全一致。

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

本仓库不隐式依赖其他 Skill 仓库。remote、安装、tag、Release、发布以及完整历史连续性
均不属于本次迁移快照。

## 独立 v0.3.0 发布生命周期

已批准的公开身份是 `junwei529/manage-project-docs`。本仓库正准备 legacy 公开版本线 `junwei529/skills@v0.2.0` 之后的首个独立 `v0.3.0` Release，但精确六文件包来自更晚的源 commit `80910a8b2375a11be897e9660c4b00a06d00dd13`，并非与 `v0.2.0` tag 字节一致。该身份与目标版本不表示 GitHub 仓库、tag、Release 或已安装副本已经存在。

Release notes 是必须经过人工审阅的发布产物。未来创建 GitHub Release 前，审阅者必须确认其准确说明 legacy `v0.2.0` lineage、`v0.2.0` 之后的包差异、不可变 release commit、所含六文件 Skill 包、已执行验证、兼容性限制，以及下述尚未闭合的证据边界。

未来生命周期路线只使用不可变 commit：

1. **安装：**公开 `v0.3.0` tag 与 Release 存在后，记录经审阅 Release 解析出的精确 commit。调用已安装的 `$skill-installer` helper，指定 `junwei529/manage-project-docs`、`--ref <release-commit>` 和 `--path skills/manage-project-docs`。helper 安装到 `$CODEX_HOME/skills/manage-project-docs`；若目标已存在则中止。
2. **验证：**将已安装六文件包的清单和 SHA-256 与 `<release-commit>` 中的包逐项比较，然后在新的 Codex turn 中执行受限 installed-copy 行为资格验证。不得把 SOURCE 资格验证当作 installed-copy 证明。
3. **更新：**先把 live 清单和 hash 与其已记录 installed commit 比较；存在本地改动时，停止并明确决定保留、迁移或丢弃。把新的已审阅 Release 解析到不可变 commit，使用 `--dest` 安装到全新 staging 并验证，再单独授权同一文件系统交换：live 改名为 rollback backup，staged 改名为 `$CODEX_HOME/skills/manage-project-docs`。第二次改名失败时立即恢复 backup；恢复失败时保留所有幸存路径并停止等待 recovery。交换成功后，必须在新的 Codex turn 中把 loaded-copy 清单和 hash 绑定到新 commit，再执行 installed-copy 行为资格验证。激活或验证失败时，先把失败 live 移到唯一 evidence path，再恢复 backup；任一移动或恢复失败时保留全部路径并停止等待 recovery。恢复完成后，必须再启动一个新的 Codex turn，把恢复后的 loaded copy 绑定到已记录的上一个 commit，并重新执行 installed-copy 资格验证；若仍失败，则保留 recovery 状态并停止。backup 与失败副本证据保留到验收完成。不得原地覆盖既有目标。
4. **卸载：**取得单独授权后，验证精确安装路径并记录是否存在本地改动，然后只删除 `$CODEX_HOME/skills/manage-project-docs`。目录有改动或身份不明确时必须停止。
5. **回滚：**把上一个已接受的不可变 commit 安装到全新 staging 并验证，复用更新步骤中的本地改动预检、受限交换和失败恢复。必须在新的 Codex turn 中把 loaded copy 绑定到 rollback commit，并重新执行 installed-copy 资格验证后才可接受回滚。

每次安装、更新、卸载、回滚、tag、Release 和发布都是独立的外部或持久化效果，必须分别获得授权。本次本地资格变更不执行其中任何操作。

证据状态必须分层：只有本地 checker、发布安全扫描、具备实质覆盖的 native review、本地 commit 和 clean post-commit checker rerun 全部成功后，才可声明 `LOCAL_RELEASE_READY`；`PUBLIC_RELEASE`、`STABLE_INSTALLED_COPY` 和广义 `EFFICACY_BOUNDARY` 在各自未来证据出现前均保持 `UNKNOWN`。
