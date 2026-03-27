# Claude Code Tips & Tricks

[![en](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![ru](https://img.shields.io/badge/lang-ru-green.svg)](README.ru.md)

> Tips, scripts and workflows for Claude Code

By [Ris](https://t.me/ris_ai) — AI development & vibecoding

A collection of customizations, scripts, and workflows for [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

## Contents

### [Statusline](./statusline/)
Custom statusline showing costs, context usage, and git branch with color-coded indicators.

### [Skills](./skills/)
Reusable skill templates for Claude Code. Currently includes:
- [**cc-analytics**](./skills/cc-analytics/) — generate HTML reports of Claude Code usage statistics
- [**ceo-council**](./skills/ceo-council/) — launch parallel sub-agents as independent C-level experts for strategic project analysis
- [**claude-md-writer**](./skills/claude-md-writer/) — create and refactor CLAUDE.md files following Anthropic best practices
- [**gh-issues**](./skills/gh-issues/) — manage GitHub Issues via CLI with AI session context storage
- [**paperclip-api**](./skills/paperclip-api/) — manage Paperclip AI agent companies via CLI and REST API
- [**readme-generator**](./skills/readme-generator/) — create human-focused README files with proper structure

#### Personal Corp Framework

A system for running a business as one person with AI agents. GitHub becomes your operating system — projects, issues, and labels replace a team of managers. Skills replace processes that live in someone's head.

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

- [**project-init**](./skills/project-init/) — guided interview → GitHub Project + labels + CLAUDE.md config. Run once to set up your command center
- [**task-routing**](./skills/task-routing/) — route issues to the correct repo using CLAUDE.md routing config before creating
- [**weekly-planning**](./skills/weekly-planning/) — turn retro findings + backlog into prioritized outcomes with Eisenhower matrix and delegation
- [**weekly-retro**](./skills/weekly-retro/) — structured retrospective: gather data from all repos, interview founder, capture findings into issues and canonical files

### [Hooks](./hooks/)
*Coming soon* — Pre/post command hooks for automation.

### [Prompts](./prompts/)
*Coming soon* — Custom prompts and CLAUDE.md examples.

### [Workflows](./workflows/)
*Coming soon* — Multi-step automation patterns.

## Installation

### Claude Code Desktop

**+** button → **Plugins** → **Add plugin** → search `ris-claude-code` → **Install**

### Claude Code CLI

Type `/plugin` in chat → **Marketplaces** tab → **Add** → `serejaris/ris-claude-code` → **Discover** tab → **Install**

### Codex

```
$skill-installer install https://github.com/serejaris/ris-claude-code/tree/main/skills/project-init
```

### Any AI agent

Skills are plain markdown files. Copy any `skills/*/SKILL.md` into your agent's instructions directory.

## Author

- Telegram: [@ris_ai](https://t.me/ris_ai) — AI development & vibecoding
- YouTube: [@serejaris](https://www.youtube.com/@serejaris)
- [vibecoding.phd](https://vibecoding.phd)

## License

MIT
