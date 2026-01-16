# Claude Code Tips & Tricks

[![en](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![ru](https://img.shields.io/badge/lang-ru-green.svg)](README.ru.md)

> Tips, scripts and workflows for Claude Code

От [Ris](https://t.me/ris_ai) — веду канал про вайбкодинг

Коллекция кастомизаций, скриптов и воркфлоу для [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

## Содержание

### [Statusline](./statusline/)
Кастомный статусбар с отображением затрат, использования контекста и git-ветки с цветовой индикацией.

### [Skills](./skills/)
Переиспользуемые шаблоны скиллов для Claude Code:
- **api-digest** — забирает сырые данные из API и генерирует детальные дайджесты без платных LLM-вызовов
- **cc-analytics** — генерирует HTML-отчёты статистики использования Claude Code
- **claude-md-writer** — создаёт и рефакторит CLAUDE.md по best practices Anthropic
- **gemini-tmux-orchestration** — делегирует задачи агенту Gemini CLI через tmux для параллельного выполнения
- **gh-issues** — управление GitHub Issues через CLI с хранением AI-контекста сессий
- **git-workflow-manager** — обеспечивает conventional commits, semantic versioning и консистентные release notes
- **macos-fixer** — диагностирует проблемы с памятью macOS и предлагает решения
- **opencode-config** — настройка OpenCode CLI с кастомными провайдерами и моделями
- **project-release** — консистентный workflow релизов с версионированием, changelog и GitHub releases
- **readme-generator** — создаёт человеко-ориентированные README с правильной структурой

### [Hooks](./hooks/)
*Скоро* — Pre/post хуки для автоматизации команд.

### [Prompts](./prompts/)
*Скоро* — Кастомные промпты и примеры CLAUDE.md.

### [Workflows](./workflows/)
*Скоро* — Паттерны многошаговой автоматизации.

## Требования

Большинство скриптов требуют:
- macOS или Linux
- `jq` — обработка JSON
- `bc` — калькулятор
- `bun` — JavaScript runtime (для ccusage)

## Установка

Каждая папка содержит свой README с инструкциями по установке.

## Автор

- Telegram: [@ris_ai](https://t.me/ris_ai) — пишу про AI-разработку и вайбкодинг
- YouTube: [@serejaris](https://www.youtube.com/@serejaris)
- [vibecoding.phd](https://vibecoding.phd)

## Лицензия

MIT
