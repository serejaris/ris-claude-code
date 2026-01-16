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
- **api-digest** — fetch raw API data and generate detailed digests without backend LLM costs
- **cc-analytics** — generate HTML reports of Claude Code usage statistics
- **claude-md-writer** — create and refactor CLAUDE.md files following Anthropic best practices
- **gemini-tmux-orchestration** — delegate tasks to Gemini CLI agent via tmux for parallel AI execution
- **gh-issues** — manage GitHub Issues via CLI with AI session context storage
- **git-workflow-manager** — enforce conventional commits, semantic versioning, and consistent release notes
- **macos-fixer** — diagnose macOS memory issues and suggest fixes
- **opencode-config** — configure OpenCode CLI with custom providers and models
- **project-release** — consistent release workflow with versioning, changelog, and GitHub releases
- **readme-generator** — create human-focused README files with proper structure

### [Hooks](./hooks/)
*Coming soon* — Pre/post command hooks for automation.

### [Prompts](./prompts/)
*Coming soon* — Custom prompts and CLAUDE.md examples.

### [Workflows](./workflows/)
*Coming soon* — Multi-step automation patterns.

## Requirements

Most scripts require:
- macOS or Linux
- `jq` — JSON processor
- `bc` — Calculator
- `bun` — JavaScript runtime (for ccusage)

## Installation

Each folder contains its own README with specific installation instructions.

## Author

- Telegram: [@ris_ai](https://t.me/ris_ai) — AI development & vibecoding
- YouTube: [@serejaris](https://www.youtube.com/@serejaris)
- [vibecoding.phd](https://vibecoding.phd)

## License

MIT
