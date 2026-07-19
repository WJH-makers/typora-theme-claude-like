# Claude Like · Typora 主题

纯 Claude 聊天气质的 Typora 主题：暖奶油纸 · 珊瑚点缀 · 双脚本字体。

<img src="https://raw.githubusercontent.com/WJH-makers/typora-theme-claude-like/main/screenshots/claude-ember-light.png" alt="Claude Like Theme" width="640">

## 安装

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

或手动：复制所有 `claude-like*.css` + `claude_fonts/` → `%APPDATA%\Typora\themes\`。

## 设计

| 层级 | 字体 | 元素 |
|------|------|------|
| 正文 | Anthropic Serif + Noto Serif SC | 段落、引用 |
| 界面 | Anthropic Sans + 雅黑 | 表头、TOC、Alert |
| 代码 | Cascadia / Anthropic Mono | 围栏、行内码 |

| 块类型 | 策略 |
|--------|------|
| 标题 | 字号/字重/底边 |
| 引用 | 左线 + 珊瑚渐变 |
| Alert | 五色语义（NOTE/TIP/IMPORTANT/WARNING/CAUTION） |
| 表格 | 轻网格 + sticky 头 + 斑马 |
| 图示 | Mermaid 卡片画布 + Claude 色调 |
| 数学 | 浅面板居中 |

强调色：`#d97757` · 背景：`#faf9f5` · 文字：`#141413`

## 字体

双脚本 `unicode-range` 隔离：Anthropic 仅 Latin → Noto Serif SC 仅 CJK，互不争抢。

## 许可

CSS：MIT · Noto Serif SC：SIL · Anthropic 字体：仅随主题本地使用

