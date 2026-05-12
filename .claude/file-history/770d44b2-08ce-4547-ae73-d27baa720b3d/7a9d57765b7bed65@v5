# 天子日课 → 微信小程序

## 架构

```
微信小程序 (Taro + React)  ──HTTPS──▶  Next.js API (Vercel 部署)
    前端/UI 层                           后端/数据层
```

现有 Next.js 后端（API Routes + 内存存储）直接复用，只需新写一个小程序前端。

## 技术选型

| 选型 | 理由 |
|------|------|
| **Taro 3.x** | React 语法，和现有代码风格一致，编译为微信小程序 |
| **NutUI** | 京东开源的小程序组件库，和 Taro 配合好 |
| **后端复用** | 现有 `/api/*` 路由不改，部署到 Vercel 获取 HTTPS 域名 |

## 项目结构

```
tianzi-rike-miniapp/
├── src/
│   ├── pages/
│   │   ├── index/          # 今日仪表盘
│   │   ├── habits/         # 习惯管理
│   │   ├── stats/          # 数据统计
│   │   ├── review/         # 每日复盘
│   │   ├── insights/       # AI 洞察
│   │   └── profile/        # 个人设置
│   ├── components/         # 通用组件
│   ├── lib/
│   │   └── api.ts          # API 客户端（从 web 项目复制）
│   ├── app.config.ts       # 页面路由、TabBar 配置
│   └── app.tsx             # 入口
├── package.json
└── project.config.json     # 微信小程序配置
```

## 页面与 TabBar

底部 TabBar（5个标签）：

| Tab | 页面 | 图标 |
|-----|------|------|
| 今日 | index | 🏠 |
| 习惯 | habits | ✅ |
| 统计 | stats | 📊 |
| 复盘 | review | ✍️ |
| 我的 | profile | 👤 |

insights 页面从"我的"进入，不占 Tab 位。

## 需要做的事

### Step 1: 初始化 Taro 项目
```bash
npx @tarojs/cli init tianzi-rike-miniapp
```
选 React + TypeScript + Webpack5 模板

### Step 2: 复制/改写代码
- `lib/api.ts` → 直接复用
- 6个页面从 Next.js 改写为 Taro（div→View, 组件适配）
- 安装 NutUI 组件库

### Step 3: 配置微信小程序
- 修改 `project.config.json`（appid 用测试号）
- 配置服务器域名 request 合法域名

### Step 4: 后端部署
- 将 Next.js 项目部署到 Vercel
- 在微信后台配置 HTTPS 域名白名单

## 前置条件

1. 微信开发者工具（免费下载）
2. 微信小程序 AppID（注册 https://mp.weixin.qq.com，或用测试号）
3. Vercel 账号（免费部署后端）

## 开发工作流

```bash
npm run dev:weapp      # Taro 编译为小程序代码
# 微信开发者工具 → 打开 dist/ 目录 → 预览/真机调试
```
