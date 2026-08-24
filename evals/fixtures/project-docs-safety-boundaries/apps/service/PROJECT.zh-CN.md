# 服务项目记录

## 目的与范围

该服务公开一个只读健康检查接口。根项目文档不拥有服务级接口事实。

## 工作与验证

接口定义的可编辑来源是 `schema/openapi.yaml`。`docs/API.md` 是生成结果。

## 权威与写入路由

| 事实 | 读取位置 | 唯一写入位置 |
|---|---|---|
| 本地服务范围与恢复 | 本文件 | 本文件 |
| API 定义 | `docs/API.md` | `schema/openapi.yaml` |
| 生产运行状态 | 外部 Wiki | 外部 Wiki |
| 当前文档 writer | `docs/WRITER.md` | `docs/WRITER.md` |

## 当前状态与证据

本地 schema 声明健康检查接口。外部 Wiki 在此 fixture 中不可用，因此生产
运行状态是 `UNKNOWN`。

## 下一步与恢复

先确认 `docs/WRITER.md` 中的 writer 已释放所有权，再取得写入授权。之后从
本文件和 schema 恢复。
