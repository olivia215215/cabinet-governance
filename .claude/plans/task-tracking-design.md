# 任务追踪自动化方案

## 天下大势

首辅制运作至今，task-log.md 全靠手动维护，格式随意、字段不全、无法回溯。内阁 2.0 需要可靠的任务数据辅助调度决策（哪个大臣效率高、哪个环节返工多）。本方案追求极简落地，不引入任何依赖。

---

## 执政方略

### 1. 记录什么（字段设计）

每条任务记录以下字段：

| 字段 | 说明 | 示例 |
|------|------|------|
| id | 自动序号，5位 | #00001 |
| title | 任务摘要 | "实现登录页面" |
| status | New / Dispatched / InProgress / Done / Blocked | InProgress |
| minister | 大臣名 | dajiang |
| created | 下旨时间 | 2026-05-09T10:00:00 |
| updated | 最后变更时间 | 2026-05-09T11:30:00 |
| duration | 耗时（从派发到完成，分钟） | 90 |
| tool_calls | 大臣使用工具次数 | 12 |
| review_rounds | 封驳轮次（仅InReview状态使用） | 2 |
| result | 结果简述 | "全部用例通过" |
| block_reason | 阻塞原因（仅Blocked） | "等待API密钥" |
| parent | 父任务id（支持拆解） | #00001 |

### 2. 谁来记 —— 首辅驱动 + hook 辅助

**原则：首辅手动保质量，hook 自动提效率。**

- **创建/派发**：首辅调 Agent 派大臣时，**手动按模板追加一条YAML记录**。这是唯一刚性约束——首辅必须填写，因为只有首辅知道任务内容、派给谁、以及关键字段。不可自动化（hook 无法理解"派活"语义）。
- **状态推进**：依赖首辅看到大臣回报后手动改状态。建议将"更新状态"作为收回报的固定动作，嵌入调度流程。
- **hook 辅助**：只做两件事——
  - `PostToolUse`：检测到 Agent 工具被调用时，把 tool_calls 计数器写入一个临时 JSON（`/Users/admin/.claude/tmp/tool-call-count.json`），供首辅后续取用。
  - `PreToolUse`：不做任何事。避免在工具调用前写日志造成干扰。

不推荐全自动方案，原因：自动解析"一条任务何时开始/结束"在 Claude Code 的 hook 框架下不可靠（hook 粒度是工具调用，不是任务）。过度自动化会引入噪音。

### 3. 怎么记 —— YAML 文件，追加写入

**数据文件**: `/Users/admin/.claude/task-log.yaml`

- 采用 **YAML 顶层列表**格式，每条任务一个 block
- 追加写入（新任务插在末尾，不破坏已有数据）
- 正文只含变动的字段（status 等），首条完整

**写入方式**：
- 首辅用 `Write` 工具（或 `Edit` 追加）操作 YAML 文件
- 模板由 CLAUDE.md 中的「派活流程」定义，首辅照填

**查询工具**（未来按需，当前可有可无）：`/Users/admin/.claude/bin/task-query.sh`
- `task-query.sh count --minister jinyi` → 查询锦衣干活次数
- `task-query.sh status --idle` → 列出超时未完成的任务
- `task-query.sh stats --field avg_review_rounds` → 平均封驳轮次
- 实现逻辑：`grep` + `awk` 解析 YAML，不出百行

### 4. 怎么用 —— 三阶渐进

| 阶段 | 用途 | 前提 |
|------|------|------|
| 第1阶 | 首辅干活时顺手记，养成习惯 | 把模板写进 CLAUDE.md |
| 第2阶 | 每5-10条后回顾一次，看调度倾向 | 数据积累 |
| 第3阶 | 用 task-query.sh 做定期度量报告 | 脚本写好 |

核心查询场景：
- **大臣维度**：某大臣一周干了几个活、平均耗时、平均工具调用次数
- **流程维度**：封驳率（InReview 次数 / 总任务数）、平均封驳轮次
- **风险维度**：Blocked 超过24小时的任务、超时（超过预估耗时2倍）的任务
- **排班依据**：哪位大臣闲着、哪位接活最多

### 5. 和现有 task-log.md 的衔接

**增量升级，不推倒重来。**

- 现有 `/Users/admin/.claude/task-log.md` 留作历史归档，不再追加新记录
- 创建 `/Users/admin/.claude/task-log.yaml` 开始全新的 YAML 数据流
- 如需历史数据迁移，用一次性的转换脚本把 #001 等旧记录转成 YAML 格式（迁移非强制，按需执行）

---

## 数据文件示例

```yaml
- id: "#00001"
  title: "更新运行机制白皮书"
  status: Done
  minister: zhubu
  created: 2026-05-09T09:00:00
  updated: 2026-05-09T11:00:00
  duration: 120
  tool_calls: 4
  review_rounds: 1
  result: "全部完成，触发三项改进"
  parent: null
```

## 兴师动众

1. **即日起**：首辅每派大臣，按上述模板追加记录到 task-log.yaml
2. **下一步**：CLAUDE.md 增加「派活模板」章节，固化记录流程
3. **未来**：task-query.sh 脚本在数据积累到 20+ 条后再写，优先保障数据质量
