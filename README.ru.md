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
- [**cc-analytics**](./skills/cc-analytics/) — генерирует HTML-отчёты статистики использования Claude Code
- [**ceo-council**](./skills/ceo-council/) — запуск параллельных субагентов в роли независимых C-level экспертов для стратегического анализа
- [**claude-md-writer**](./skills/claude-md-writer/) — создаёт и рефакторит CLAUDE.md по best practices Anthropic
- [**gh-issues**](./skills/gh-issues/) — управление GitHub Issues через CLI с хранением AI-контекста сессий
- [**readme-generator**](./skills/readme-generator/) — создаёт человеко-ориентированные README с правильной структурой

#### Personal Corp Framework

Система для управления бизнесом одного человека через AI-агентов. GitHub становится операционной системой — проекты, issues и labels заменяют команду менеджеров. Скиллы заменяют процессы, которые живут у кого-то в голове.

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

- [**project-init**](./skills/project-init/) — интервью → GitHub Project + labels + конфиг в CLAUDE.md. Запускается один раз для настройки командного центра
- [**task-routing**](./skills/task-routing/) — маршрутизация issues в правильный репо через конфиг CLAUDE.md перед созданием
- [**weekly-planning**](./skills/weekly-planning/) — превращает ретро + бэклог в приоритизированные outcomes с матрицей Эйзенхауэра и делегированием
- [**weekly-retro**](./skills/weekly-retro/) — структурированное ретро: сбор данных из всех репо, интервью с основателем, фиксация в issues и canonical files

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
