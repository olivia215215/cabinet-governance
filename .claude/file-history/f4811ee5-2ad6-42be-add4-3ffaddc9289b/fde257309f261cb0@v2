# AI 产品经理技能包安装计划

## Context
用户是 AI 产品经理，希望安装一套日常工作中必备的 Claude Code 技能。调研发现官方市场无现成 PM 技能，需要从零创建 8 个自定义技能，安装到全局 `~/.claude/skills/`。

## 技能清单与设计

### 1. prd-writer — PRD 撰写
**触发场景**: 用户提到 PRD、产品需求文档、需求规格、写需求
**SKILL.md 核心指令**:
- 生成 7 段式 PRD 结构：背景与目标 → 用户分析 → 功能描述 → 非功能需求 → 验收标准 → 里程碑 → 风险与假设
- 支持指定模板偏好（简洁/详细/敏捷用户故事式）
- 从用户对话中提取需求要点并追问缺失信息

### 2. competitor-analysis — 竞品分析
**触发场景**: 竞品、对比分析、competitive、SWOT、功能对比
**SKILL.md 核心指令**:
- 结构化分析框架：市场定位 → 目标用户 → 核心功能矩阵 → 定价策略 → 优劣势
- 生成功能对比表、SWOT 分析
- 引导用户明确竞品名称和维度

### 3. user-story-generator — 用户故事生成
**触发场景**: 用户故事、user story、As a...、验收条件
**SKILL.md 核心指令**:
- 标准格式：As a [角色], I want [功能], so that [价值]
- 自动生成验收条件 (AC)、优先级建议
- 支持批量生成和 INVEST 原则校验

### 4. roadmap-planner — 产品路线图
**触发场景**: 路线图、roadmap、版本规划、迭代计划
**SKILL.md 核心指令**:
- 生成 Now/Next/Later 或时间轴式路线图
- 功能优先级矩阵（影响力 vs 复杂度）
- 里程碑与依赖关系梳理

### 5. market-research — 市场研究
**触发场景**: 市场分析、TAM、用户画像、市场调研
**SKILL.md 核心指令**:
- TAM/SAM/SOM 估算框架
- 用户画像 (Persona) 生成
- 市场趋势和机会分析

### 6. data-analysis-pm — 产品数据分析
**触发场景**: 指标、漏斗、留存、A/B 测试、数据分析
**SKILL.md 核心指令**:
- 关键产品指标定义（北极星指标、AARRR 模型）
- 漏斗分析、留存分析、Cohort 分析方案
- A/B 测试设计与评估

### 7. agile-management — 敏捷管理
**触发场景**: Sprint、站会、回顾、backlog、迭代
**SKILL.md 核心指令**:
- Sprint 计划生成、Story Point 估算
- 站会纪要模板、Sprint 回顾总结
- Backlog 梳理与优先级排序

### 8. doc-automation — 文档自动化
**触发场景**: 周报、会议纪要、公告、Release Notes
**SKILL.md 核心指令**:
- 从要点生成结构化周报/月报
- 会议纪要标准模板
- Release Notes 和产品公告撰写

## 实现方式

每个技能在 `~/.claude/skills/<skill-name>/` 下创建：
```
SKILL.md              # 技能定义（YAML frontmatter + Markdown 指令）
references/
  templates.md        # 模板库（可选，复杂技能用）
```

SKILL.md 结构：
```yaml
---
name: <skill-name>
description: <触发关键词和场景>
---

# 技能指令正文
## 角色
## 工作流程
## 输出格式
## 追问清单
```

## 实施步骤

1. 创建 8 个技能目录结构
2. 为每个技能编写 SKILL.md
3. 为复杂技能（prd-writer, competitor-analysis, roadmap-planner）添加 references/templates.md
4. 验证：用 `/skill-name` 测试每个技能的触发和输出

## 验证方法

- 检查 `~/.claude/skills/` 目录结构是否正确
- 用典型 PM 场景触发每个技能，确认能正确识别并执行
- 测试示例："/prd-writer 做一个用户反馈收集功能"
