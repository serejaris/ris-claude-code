# Claude Code Tips & Tricks

[![en](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![ru](https://img.shields.io/badge/lang-ru-green.svg)](README.ru.md)

> Tips, scripts and workflows for Claude Code

By [Ris](https://t.me/ris_ai) — AI development & vibecoding

A collection of customizations, scripts, and workflows for [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

## Skills

| Skill | What it does |
|-------|-------------|
| [product-data-audit](./skills/product-data-audit/) | Deep product/business audit → interactive HTML report with 12 sections |
| [cc-analytics](./skills/cc-analytics/) | HTML reports of Claude Code usage statistics |
| [ceo-council](./skills/ceo-council/) | Parallel sub-agents as C-level experts for strategic analysis |
| [claude-md-writer](./skills/claude-md-writer/) | Create and refactor CLAUDE.md files following best practices |
| [gh-issues](./skills/gh-issues/) | Manage GitHub Issues via CLI with session context |
| [paperclip-api](./skills/paperclip-api/) | Manage Paperclip AI agent companies via CLI and REST API |
| [readme-generator](./skills/readme-generator/) | Human-focused README files with proper structure |

#### Personal Corp Framework

A system for running a business as one person with AI agents. GitHub becomes your operating system.

```mermaid
graph LR
    A[project-init] -->|creates config| B[task-routing]
    B -->|creates issues| C[weekly-planning]
    C -->|prioritizes| D[weekly-retro]
    D -->|feeds back| C
    style A fill:#10b981,color:#fff
    style B fill:#8b5cf6,color:#fff
    style C fill:#3b82f6,color:#fff
    style D fill:#f59e0b,color:#fff
```

| Skill | What it does |
|-------|-------------|
| [project-init](./skills/project-init/) | Guided interview → GitHub Project + labels + CLAUDE.md config |
| [task-routing](./skills/task-routing/) | Route issues to the correct repo using routing config |
| [weekly-planning](./skills/weekly-planning/) | Retro findings + backlog → prioritized outcomes with Eisenhower matrix |
| [weekly-retro](./skills/weekly-retro/) | Structured retrospective: gather data, interview founder, capture findings |

## Other

### [Statusline](./statusline/)
Custom statusline showing costs, context usage, and git branch with color-coded indicators.

## Installation

### Install a single skill

Tell your agent:

> Install this skill: `https://github.com/serejaris/ris-claude-code/tree/main/skills/cc-analytics`

Replace `cc-analytics` with any skill name from the table above.

### Install all skills (plugin)

**Claude Code Desktop:** **+** → **Plugins** → search `ris-claude-code` → **Install**

**Claude Code CLI:** `/plugin` → **Marketplaces** → **Add** → `serejaris/ris-claude-code` → **Discover** → **Install**

### Manual

Skills are plain markdown files. Copy `skills/<name>/SKILL.md` into `~/.claude/skills/<name>/`.

## Author

- Telegram: [@ris_ai](https://t.me/ris_ai) — AI development & vibecoding
- YouTube: [@serejaris](https://www.youtube.com/@serejaris)
- [vibecoding.phd](https://vibecoding.phd)

## License

MIT
