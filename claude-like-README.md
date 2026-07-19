# Claude-like · v7 Full Markdown

纯 Claude 聊天气质的 Typora 主题：**暖奶油纸 · 珊瑚点缀 · 全 MD 样式体系**。

## 文件

| 菜单 | 文件 |
|------|------|
| Claude Like | `claude-like.css` |
| Claude Like Dark | `claude-like-dark.css` |
| Claude Like Grey | `claude-like-grey.css` |
| 共享规则 | `claude-like-base.css`（勿单独选） |

字体：`claude_fonts/`。

## 设计系统（深度分层）

| 层级 | 字体 | 典型元素 |
|------|------|----------|
| 正文叙事 | Serif（Anthropic Serif + 中文衬线） | 段落、引用正文 |
| 界面/表头 | Sans（Anthropic Sans + 雅黑） | 表头、TOC、徽章、Alert 标签感 |
| 代码 | Mono | 围栏、行内码、自动链接 URL |

| 块类型 | 视觉策略 |
|--------|----------|
| 标题 | 字号/字重/底边，无彩虹左边轨 |
| 引用 | 左线 + 极淡珊瑚渐变；嵌套加深 |
| Alert | 五色语义左边 + 浅底 |
| 表格 | 轻网格 + sticky 头 + 斑马（v6） |
| 图示 | v8 网格画布 + 小图 zoom + 加粗描边/标签 |
| 代码 | 安静 CM，不破坏行号几何 |
| 数学 | 浅面板居中 |
| TOC/脚注 | 卡片化分区 |
| 任务 | 珊瑚自定义 checkbox |

## 样式覆盖矩阵

| 类别 | 状态 | 组合场景 |
|------|------|----------|
| 标题 h1–h6（含标题内 code） | ✓ | |
| 段落 / 硬换行 / 导语段 | ✓ v7 | h1+p |
| 链接 / 自动链接 / 引用式 | ✓ v7 | visited / mono URL |
| strong/em/粗斜组合 | ✓ v7 | |
| del / mark / u / ins | ✓ | mark+code |
| sub/sup | ✓ | |
| code / kbd / samp / var | ✓ | 表内缩小 |
| abbr/cite/q/dfn/time/small | ✓ v7 | |
| blockquote 嵌套 3 层 | ✓ | |
| 引用内 ul/ol/code/table | ✓ v7 | |
| li 内 blockquote/code/table | ✓ v7 | |
| ul/ol 深度 marker | ✓ v7 | disc/circle/square · dec/alpha/roman |
| 松散列表多段 | ✓ v7 | |
| 任务列表 + 完成态 + 嵌套 | ✓ v7 | Alert 内任务 |
| 定义列表 | ✓ | |
| hr | ✓ | |
| 表格全形态 | ✓ v6 | 对齐/宽表/表内 code/链接/公式 |
| 图片/图题/坏图 | ✓ | |
| video/audio/iframe | ✓ v7 卡片 | |
| details/summary 嵌套 | ✓ v7 | |
| 代码围栏多语言 | ✓ | |
| mermaid/flowchart/sequence/… | ✓ v8 画布/放大 | |
| 数学行内/块 | ✓ v7 面板 | |
| YAML front matter | ✓ | |
| TOC | ✓ | |
| 脚注区 | ✓ v7 卡片 | |
| GFM Alerts ×5 + 内嵌 | ✓ v7 | |
| ruby | ✓ | |
| emoji | ✓ | |
| 源码模式 | ✓ | |
| 侧栏/菜单/焦点 | ✓ | |
| 打印/PDF | ✓ | 表+图示+TOC |

实验性/废弃 HTML（portal 等）不覆盖。

## 表格变量

`--table-header-bg` · `--table-grid-color` · `--table-zebra` · `--table-hover-color` · `--table-sticky-shadow`

## 图示 · Typora 官方变量 + v8 卡片

> 官方文档：Diagram Options（Typora support）。引擎读的是 **`:root` CSS 变量**；卡片外观是我们的 chrome。

### 官方 Mermaid / Sequence（已写入三皮肤）

| 变量 | Light | Dark | Grey | 说明 |
|------|-------|------|------|------|
| `--mermaid-theme` | **neutral** | **night** | **dark** | base / default / dark / forest / neutral / night |
| `--mermaid-font-family` | UI + 中文无衬线 | 同左 | 同左 | 覆盖默认 trebuchet |
| `--mermaid-sequence-numbers` | **on** | on | on | 时序自动序号 |
| `--mermaid-flowchart-curve` | **basis** | basis | basis | linear / basis / natural / step |
| `--mermaid--gantt-left-padding` | 90 | 90 | 90 | 注意官方是 **双连字符** |
| `--sequence-theme` | simple | simple | simple | js-sequence：simple \| hand |

**导出注意（官方）：** PDF/HTML 必须选 **同一套主题**，否则 `--mermaid-*` 不会进导出文件。

左对齐（可选）：在皮肤加 `--diagram-text-align: left; --diagram-align-items: flex-start;`  
或官方写法：`.md-diagram-panel-preview { text-align: left; }`

### 单块覆盖 · Mermaid Directives / Frontmatter

完整文档：
- https://mermaid.js.org/config/directives.html （`%%{init}%%`，**≥10.5 标记 deprecated**）
- https://mermaid.js.org/config/configuration.html （frontmatter `config:` 推荐）
- https://mermaid.js.org/config/theming.html （`theme` + **仅 base 可 themeVariables**）

**层级：** defaultConfig ← Typora 皮肤 `:root --mermaid-*`（≈ siteConfig）← 图内 frontmatter/directive

**Directive 结构：**

```text
%%{
  init: {
    "theme": "neutral",
    "fontFamily": "...",
    "flowchart": { "curve": "basis" },
    "sequence": { "wrap": true, "showSequenceNumbers": true }
  }
}%%
```

- 根键 `init` 或 `initialize`；多条会合并，同键以后者为准  
- JSON 键名建议双引号  
- 主题名：`default` | `base` | `dark` | `forest` | `neutral`  
- **自定义 Claude 陶土色：必须 `theme: base` + `themeVariables`**（hex，勿写 red 等颜色名）

**Frontmatter（推荐）：**

```yaml
---
config:
  theme: base
  themeVariables:
    primaryColor: "#f5e6d8"
    primaryBorderColor: "#c45c3e"
    primaryTextColor: "#1c1917"
    lineColor: "#78716c"
    background: "#fffaf3"
  flowchart:
    curve: basis
---
```

可复制的完整 Claude 暖色样例见桌面 `claude-like-qa.md` §13 D/E。

### v8 卡片 chrome

| 变量 | 作用 |
|------|------|
| `--diagram-bg` / `--diagram-border` / `--diagram-shadow` | 外卡片 |
| `--diagram-canvas-bg` / `--diagram-grid` | 内画板 + 网格 |
| `--diagram-canvas-min-h` | 画板最小高度（少节点） |
| `--diagram-svg-zoom` | 小图放大（~1.32） |
| `--diagram-svg-min-w` / `--diagram-svg-min-h` | SVG 最小占位 |
| `--diagram-label-size` / `--diagram-stroke-w` | 标签与描边增强 |

再放大：`--diagram-svg-zoom: 1.45` 或 `--diagram-canvas-min-h: 18rem`。

## 使用

1. 主题 → **Claude Like**  
2. **完全退出 Typora 再开**  
3. 打开桌面 `claude-like-qa.md` 通读验收  
4. 再用 `全标签指令大全_难度与频次.md` 看密集表+长文  

## 版本

| 版 | 内容 |
|----|------|
| v5 | Claude Quiet |
| v6 | 表格 sticky/网格/打印 |
| v6.1 | 图示卡片 |
| v7 | 全 MD 组合样式与边界场景 + 完整 QA |
| v8 | 图示：固定画布 / 小图 zoom / 描边标签对比 |
| v9 | 图示字号 + LaTeX 块面板 + 嵌套压力测试 |
| v10–10.2 | 图示 SAFE / 尺寸平衡 / flow 语法 |
| v11 | 字体缺字修复、取消全局 box-sizing、配置 strict/diagram |
| **v12** | 困难 MD 全量样式实验室（Alert/TOC/脚注/表/数学/图示/HTML） |
| **v15** | Mermaid 近库存（去掉错误 CSS 字号/zoom 翻车） |
| **v16** | 表格 `width:auto`；Mermaid 整图 zoom + 禁止 `max-width` 压扁节点 |
| **v17** | §60 全标签嵌套韵律：引用 6 层 / 列表 6 层 / Alert / Details / 交叉组合 |
| **v18** | Details 回归原生三角；禁 flex summary；HTML 块无空行；Mermaid 社区 init 范式 |
| **v19** | Mermaid：非标准 theme 名注入 Claude 色；舞台居中；zoom/高度迭代 |
| **v20** | §70 综合 GitHub/中文排版/Bear/Obsidian 优点；修大屏栏宽倒置；标题/表/码/链节奏 |

### v20 合成要点

见桌面 `MD渲染研究-v20.md`。核心：栏宽随屏加宽、中文行高 1.75、标题上松下紧、表 width:auto、mermaid 通栏居中、details 引擎诚实。

### v17 全标签嵌套

统一变量：`--nest-gap-*` · `--nest-indent` · `--nest-code-scale` · `--nest-table-scale`

| 组合 | 策略 |
|------|------|
| 引用 1–6 | 边线实→虚→点，底渐弱 |
| 列表 6 层 | 左轨 + marker 循环，深层略收字号 |
| 任务嵌套 | checkbox 不与 marker 抢位 |
| Details 3 层 | 底色递进 |
| Alert × 内嵌 | 无重影阴影，内层克制 |
| 任意 ⊃ 码/表/公式 | 统一缩小比例 + 间距 |
| 嵌套 Mermaid | `--diagram-mermaid-zoom-nested: 1.18` |

验收：桌面 `claude-like-全标签嵌套验收.md`

### v16 Mermaid / 表格

| 变量 | 默认 | 作用 |
|------|------|------|
| `--diagram-mermaid-zoom` | `1.28` | 整图放大（节点+字同步）；可调 `1.4` |
| `--diagram-flow-zoom` | `1.12` | 经典 ```flow |

**勿**对 `[lang=mermaid] .node text` 写大 `font-size !important`（框按渲染时字号计算，后改只动字）。

验收：桌面 `mermaid-测试.md`。完全退出 Typora 再开。

备份目录：`backup-claude-like-v6-*`；`%TEMP%\typora-mermaid-v16-*`。
| **v21** | 三皮肤节奏对齐：dark/grey 行高 1.75、段距 0.72em、显式三档栏宽 48/52/56rem（2026-07-18） |
