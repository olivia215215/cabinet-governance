# UI 专业优化 — 融合风格（企业功能 + 现代审美）

## 目标

将系统从"能用"升级到"专业"，对标 Linear/Notion 的现代审美 + ServiceNow 的企业功能密度。

## 改动清单

### 1. 全局视觉升级 — `app/globals.css`

| 改动 | 现状 | 目标 |
|------|------|------|
| 圆角 | `--radius: 0.625rem` | `0.75rem`（更柔和） |
| 卡片阴影 | 无 | 新增 `--shadow-card: 0 1px 3px 0 rgb(0 0 0 / 0.06)` |
| 背景色 | 纯白 `oklch(1 0 0)` | `oklch(0.985 0 0)`（微灰底，区分卡片和背景） |
| 侧边栏背景 | `oklch(0.985 0 0)` | 保持，加 subtle gradient |
| 选中文本色 | 无 | `::selection { bg-primary/20 }` |
| 滚动条 | 浏览器默认 | 自定义细滚动条 `w-1.5 rounded-full bg-muted` |
| 标题字距 | 无 | `h1/h2 tracking-tight` 全局设置 |

### 2. 侧边栏重设计 — `components/layout/sidebar.tsx`

- 导航项分组：加 section header（"工作台"/"管理"/"数据"等分类标签）
- 活跃态：左侧蓝色竖线 `border-l-2 border-primary` + bg 高亮
- 品牌区：logo 容器加渐变背景，品牌名加粗
- 收起按钮：移到侧栏底部，样式更精致
- 角色调试面板：缩小、收到底部

### 3. 顶部栏优化 — `components/layout/header.tsx`

- 玻璃态效果：`bg-background/80 backdrop-blur-md border-b` 
- 面包屑样式优化

### 4. 卡片系统升级 — `components/ui/card.tsx`

- Card 默认：`shadow-sm`（替代纯 border）
- 交互卡片 hover：`hover:shadow-md transition-shadow`
- 卡片内边距调整

### 5. 仪表盘/首页升级 — `app/home/page.tsx`

- 统计卡片：每张卡片左侧加彩色图标（蓝/绿/黄），数字更突出
- 快捷操作：改为图标+文字的卡片式布局（替代纯按钮列表）
- 工单列表项：左侧加类型图标，hover 阴影效果

### 6. 登录页升级 — `app/login/page.tsx`

- 卡片加 shadow，大圆角
- 标题下方加副标题
- Demo 按钮移到下方，小字说明
- 整体居中布局更精致

### 7. 其他页面统一

- 列表项 hover 从 `bg-muted/50` 改为 `bg-accent` + 微阴影
- 详情页信息网格用 Card 包裹
- 状态徽章统一大小和间距

## 不动的

- 功能逻辑、API 调用、数据流 — 纯视觉改动
- 暗色模式已有的值保持兼容

## 验收

- `tsc --noEmit` 零错误
- 亮/暗模式都可渲染
- 移动端侧栏正常
- 所有页面视觉一致
