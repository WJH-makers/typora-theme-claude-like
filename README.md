# Typora Theme · Claude Like

纯 Claude 聊天气质的 [Typora](https://typora.io/) 主题：**暖奶油纸 · 珊瑚点缀 · 双脚本字体 · 全 Markdown 样式体系**。

| 项 | 说明 |
|---|---|
| 作者 | [WJH-makers](https://github.com/WJH-makers) |
| 适配 | Typora **1.13+**（Mermaid **11.13** 图示实测） |
| 主题版本 | **base v37** + **user overlay v38** |
| 皮肤 | Light / Dark / Grey |

---

## 预览气质

- **正文**：Anthropic Serif（Latin）+ Noto Serif SC（仅 CJK）
- **UI / 表头 / TOC**：Anthropic Sans + 系统中文无衬线
- **代码**：Cascadia / Anthropic Mono
- **强调色**：陶土珊瑚 `#d97757`，背景奶油纸 `#faf9f5`

---

## 文件结构

把整个仓库内容复制到 Typora 主题目录（见下方安装）：

```text
typora-theme-claude-like/
├── claude-like.css          # Light 皮肤（菜单：Claude Like）
├── claude-like-dark.css     # Dark
├── claude-like-grey.css     # Grey
├── claude-like-base.css     # 共享规则（勿单独选）
├── claude-like.user.css     # v38 用户叠层（自动随主题加载）
├── claude_fonts/            # 内嵌字体（含 Noto Serif SC ~24MB）
├── THEME-DEFAULTS.md        # 字体/图示约定与验收备忘
├── install.ps1              # Windows 一键安装
└── README.md
```

| 菜单名 | 文件 |
|--------|------|
| Claude Like | `claude-like.css` |
| Claude Like Dark | `claude-like-dark.css` |
| Claude Like Grey | `claude-like-grey.css` |

Typora 会按皮肤名自动加载同名 `*.user.css`（例如选 Light 时加载 `claude-like.user.css`）。

---

## 安装（Windows）

### 方式 A · 脚本

```powershell
# 在本仓库根目录
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

脚本会复制到：`%APPDATA%\Typora\themes\`

### 方式 B · 手动

1. 打开 `%APPDATA%\Typora\themes\`
2. 复制本仓库中的全部 `claude-like*` 文件与 `claude_fonts/` 目录
3. **完全退出 Typora 再启动**
4. 主题菜单 → **Claude Like**

macOS 主题目录一般为：`~/Library/Application Support/abnerworks.Typora/themes/`

---

## 设计系统（摘要）

| 层级 | 字体 | 典型元素 |
|------|------|----------|
| 正文叙事 | Serif（Anthropic + 中文衬线） | 段落、引用正文 |
| 界面 / 表头 | Sans | 表头、TOC、徽章、Alert |
| 代码 | Mono | 围栏、行内码、URL |

| 块类型 | 视觉策略 |
|--------|----------|
| 标题 | 字号/字重/底边，无彩虹左边轨 |
| 引用 | 左线 + 极淡珊瑚渐变；嵌套加深 |
| Alert | 五色语义左边 + 浅底（GFM） |
| 表格 | 轻网格 + sticky 头 + 斑马 |
| 图示 | 卡片画布 + 小图 zoom；禁止压扁 SVG |
| 代码 | 安静 CodeMirror，不破坏行号几何 |
| 数学 | 浅面板居中 |
| TOC / 脚注 | 卡片化分区 |
| 任务列表 | 珊瑚自定义 checkbox |

### v37 · 双脚本字体（CDP 实测）

**问题**：Noto Serif SC 无 `unicode-range` 且排在栈首 → 抢走 Latin，Anthropic 永不绘制。

**修复**：Anthropic 在前且 Latin 子集；Noto **仅 CJK + 全角** `unicode-range`。

### v38 · user 叠层

- HTML `<dl>` 卡片化  
- `div[align=center]` 徽章墙（class/id 在 live 中会被剥）  
- 非 GFM `table` 卡片格  
- 外站 fence（geojson / stl / plantuml…）提示条  
- 深层引用内 Mermaid 缩放、打印 `break-inside`

---

## 图示约定（Typora 官方变量）

引擎读取的是 **`:root` CSS 变量**；卡片外观是主题 chrome。

| 变量 | Light 默认 | 说明 |
|------|------------|------|
| `--mermaid-theme` | `base` / 兼容 `neutral` | 皮肤内定义 |
| `--mermaid-font-family` | UI 无衬线栈 | 覆盖 trebuchet |
| `--mermaid-sequence-numbers` | `on` | 时序序号 |
| `--mermaid-flowchart-curve` | `basis` | 曲线 |
| `--mermaid--gantt-left-padding` | `90` | 官方双连字符 |

导出 PDF/HTML 时请选 **同一套主题**，否则 `--mermaid-*` 不会进导出文件。

单图配置优先 YAML frontmatter：

```yaml
---
config:
  theme: base
  themeVariables:
    primaryColor: "#f5e6d8"
    primaryBorderColor: "#c45c3e"
    primaryTextColor: "#1c1917"
  flowchart:
    curve: basis
---
```

`%%{init}%%` 自 Mermaid ≥10.5 起 deprecated，仍兼容。

### Mermaid 坑位备忘（Typora 1.13.7 实测）

| 点 | 建议 |
|----|------|
| `packet-beta` | bit 段须连续（0-7, 8-15…） |
| `venn-beta` | 官方 `set` / `union A,B["label"]`，勿用 `A&B` 缩写 |
| `architecture-beta` | 简单 group/service 本机可通过 |
| SVG | 勿对节点 `font-size !important` 事后改字号（框按渲染时计算） |

---

## 版本简表

| 版 | 内容 |
|----|------|
| v5–v12 | Quiet → 全 MD / QA / 困难样式实验室 |
| v15–v20 | Mermaid 稳定、表格 width:auto、嵌套韵律、中文排版 |
| **v37** | 双脚本字体 + 对比度 + 图示安全（无 reduced-motion 通配） |
| **v38** | `claude-like.user.css` 叠层：dl / align center / 外站 fence |

更细的变更与变量见 `THEME-DEFAULTS.md`、仓库内 `claude-like-README.md`（历史长文）。

---

## 许可

- **主题 CSS**：MIT（见 [LICENSE](./LICENSE)）
- **Anthropic 字体文件**：仅随主题分发供本地 Typora 使用；权利归原厂商，再分发请遵守其条款
- **Noto Serif SC**：SIL Open Font License

---

## 致谢

- [Typora](https://typora.io/) 主题机制与 Diagram Options  
- [Mermaid](https://mermaid.js.org/)  
- Claude / Anthropic 品牌气质参考（非官方主题）

