# Claude-like v37 · 字体双脚本 + 图表可视化

## 1. 已回退 / 已保留

- v35 **§92 CINEMA**（光晕、H3◈、大玻璃、hover 浮起等）已删除。  
- 保留：v34 审计修复（Mermaid viewBox、链接色、坏图占位、嵌套安全、无 `*` reduced-motion）。

## 2. v37 字体（CDP 2026-07-15）

**问题**：Noto Serif SC 无 `unicode-range` 且排在栈首 → 抢走 Latin，Anthropic 永远不绘制（`fonts.check` = false）。

**修复**：

| Face | unicode-range | 栈位置 |
|------|---------------|--------|
| Anthropic Serif/Sans/Mono | Latin 子集 | **先** |
| Noto Serif SC | **仅 CJK + 全角** | 后 |

栈：

```text
--font-body: Anthropic Serif → Noto Serif SC → Songti → Georgia → YaHei
--font-ui:   Anthropic Sans  → YaHei → PingFang → Segoe
--font-mono: Cascadia → … → Anthropic Mono
```

**对比度**：`del` 由 opacity 0.62 + 浅灰 → 0.88 + `#5c5a55`（原 ~3.28 未过 AA）。

## 3. 图表：Typora 能做什么

| 类型 | 语法 | 说明 |
|------|------|------|
| 饼图 | `mermaid` + `pie` | 占比 |
| 柱/折线/组合 | `mermaid` + `xychart-beta` | 直方图近似、随时间折线 |
| 甘特 / 时间线 / 桑基 / 象限 / 思维导图 | mermaid | 流量、矩阵、icon |
| 流程/状态/类/Git/ER/C4/journey | mermaid | 结构图 |
| packet / kanban / radar / treemap / block | mermaid 11.x | packet **须连续 bit 段** |
| venn / ishikawa | mermaid 11.13 | Typora 1.13+ |
| 序列 | `sequence` 或 mermaid sequence | js-sequence（legacy） |
| 流程 | `flow` | flowchart.js（legacy） |
| 任意矢量/正弦/图标 | HTML **SVG** | 最自由 |
| architecture-beta | 简单 group/service 可过 | 复杂布局视引擎而定 |
| venn-beta | 须 `set` / `union` | 勿用 `A&B` 缩写 |
| ECharts 动态交互 | ❌ 无内置 | 导出图插入 |

本地验收套件（可选，不在本仓库）：桌面 `Typora_Mermaid全类型_CDP实测.md`

## 4. 主题对图的约定

- 居中：`text-align:center` on preview（mermaid/flow/sequence）
- **禁止** SVG `max-width:!important`（避免盖掉 mermaid 内联尺寸）
- flow `zoom: 1.75`（CDP 原始约 62px）
- sequence `zoom: 1.12`
- `--mermaid-theme: base`（light）；dark 皮肤用 `night`
- `--mermaid-font-family` → Anthropic Sans + 中文 UI 栈（不再用 trebuchet 默认）
- 宽图（Gantt/XY）可横滚
- 自定义 SVG：限宽居中
- 配置优先 YAML frontmatter `--- config: ---`；`%%{init}%%` 自 Mermaid 10.5.0 deprecated 仍兼容

## 5. §92 炫酷模式（验收 §18）

| 模式 | 类 / 语法 | CSS |
|------|-----------|-----|
| diff 围栏 | ` ```diff ` | `.cm-positive` / `.cm-negative` + token 色 |
| Badge 墙 | `.md-showcase-center` 或 `align="center"` | 居中卡片底 |
| 卡片网格 | `.md-card-grid` > `.md-card` | auto-fit 多栏 |
| SVG 进度条 | 行内 `<svg>` | 表格内 vertical-align |

GitHub 独享 `geojson`/`stl` **不**在主题内渲染。

## 6. v38 user 修复层

文件：`claude-like.user.css`（自动加载）

- HTML `<dl>` 卡片化  
- `div[align=center]` 徽章墙（不依赖 class）  
- `table:not(.md-table)` 卡片格（GFM 表除外）  
- 外站 fence（geojson/stl/plantuml…）提示条  
- 深层引用 mermaid zoom、打印 break-inside  

## 7. 自检

```text
偏好 → 启用 Diagrams + Callouts/Alerts + 公式/脚注/高亮
主题 Claude Like → 完全退出再开（或 1.13 Reload）
打开 Typora引擎-全图谱实测.md
期望：dl 卡片 · align 居中徽章 · 外站 fence 有灰提示 · Mermaid 无 Syntax error
成绩口径：91 项 · 80/4/7 · 有效 93% · A
```