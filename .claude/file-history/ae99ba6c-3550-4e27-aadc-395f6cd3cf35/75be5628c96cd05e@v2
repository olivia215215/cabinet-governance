---
name: use-skills-with-agents
description: 派大臣干活时必须同时调用对应的 Skill，大臣 + Skill 配合使用
type: feedback
originSessionId: c11efbf6-8e99-4d9b-9ae7-74981e78dedd
---

首辅调度大臣时，必须同时考虑挂什么 Skill。Skill 提供结构化流程，Agent 提供角色和工具，两者互补。

## 大臣-Skill 映射

### 内阁九卿

| 大臣 | 主 Skill | 辅 Skill | 说明 |
|------|----------|----------|------|
| 大匠（代码实现）| `test-driven-development` | `verification-before-completion`, `finishing-a-development-branch` | TDD 写码，完成前自验证，收尾用分支清理 |
| 御史（代码审查）| `code-review` | `receiving-code-review`, `security-review` | 主动审 + 接收他人审 + 安全审计 |
| 锦衣（技术调研）| `brainstorming` | — | 调研探索，发散思维 |
| 提刑（Bug排查）| `systematic-debugging` | — | 系统化排障，从症状到根因 |
| 尚书（PRD/产品）| `writing-plans` | `requesting-code-review` | 写方案 + 发起评审 |
| 都督（CI/CD/部署）| `verification-before-completion` | — | 部署前后验证 |
| 画院（UI/UX）| `frontend-design` | `web-design-guidelines` | 前端设计 + 设计规范审查 |
| 户部（数据分析）| `xlsx` | `perf-profile` | 数据报表产出 + 性能分析 |
| 镇抚（QA测试）| `test-driven-development` | — | 测试先行 |

### 首辅自用

| 场景 | Skill |
|------|-------|
| 多大臣并行调度 | `dispatching-parallel-agents` |
| 子代理驱动开发 | `subagent-driven-development` |
| 执行既定方案 | `executing-plans` |
| 系统自进化 | `self-improving-agent` |

### 主簿（跑腿）

| 场景 | Skill |
|------|-------|
| 收尾分支 | `finishing-a-development-branch` |
| 执行重复流程 | `executing-plans` |
| Git worktree 隔离 | `using-git-worktrees` |

### 总管（生活助理）

无强制 skill 映射，按任务特征动态判断。

## 调用方式

先 `Skill(skill="xxx")` 加载流程，再在 Agent prompt 中告知按该流程行事。或者 Agent prompt 中直接要求调用 Skill。

**Why:** 首辅被训了——Skill 系统是现成的，不用等于浪费。
**How to apply:** 每次派大臣之前，动态判断：任务特征是否和 skill 的适用场景匹配？合适才挂，不匹配不硬套。Skill 是工具不是仪式。
