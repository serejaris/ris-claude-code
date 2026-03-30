# Claude Code Tips & Tricks

[![en](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![ru](https://img.shields.io/badge/lang-ru-green.svg)](README.ru.md)

> Tips, scripts and workflows for Claude Code

От [Ris](https://t.me/ris_ai) — пишу про AI-разработку и вайбкодинг

Коллекция кастомизаций, скриптов и воркфлоу для [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

## Skills

| Скилл | Что делает |
|-------|-----------|
| [product-data-audit](./skills/product-data-audit/) | Глубокий аудит продукта/бизнеса — интерактивный HTML-отчёт на 12 секций |
| [cc-analytics](./skills/cc-analytics/) | HTML-отчёты статистики использования Claude Code |
| [ceo-council](./skills/ceo-council/) | Параллельные субагенты в роли C-level экспертов для стратегического анализа |
| [claude-md-writer](./skills/claude-md-writer/) | Создание и рефакторинг CLAUDE.md по best practices |
| [gh-issues](./skills/gh-issues/) | Управление GitHub Issues через CLI с хранением контекста сессий |
| [paperclip-api](./skills/paperclip-api/) | Управление компаниями AI-агентов Paperclip через CLI и REST API |
| [readme-generator](./skills/readme-generator/) | Человеко-ориентированные README с правильной структурой |

#### Personal Corp Framework

Система для управления бизнесом одного человека через AI-агентов. GitHub становится операционной системой.

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

| Скилл | Что делает |
|-------|-----------|
| [project-init](./skills/project-init/) | Интервью — GitHub Project + labels + конфиг в CLAUDE.md |
| [task-routing](./skills/task-routing/) | Маршрутизация issues в правильный репо через конфиг |
| [weekly-planning](./skills/weekly-planning/) | Ретро + бэклог — приоритизированные outcomes с матрицей Эйзенхауэра |
| [weekly-retro](./skills/weekly-retro/) | Структурированное ретро: сбор данных, интервью с основателем, фиксация в issues |

## Other

### [Statusline](./statusline/)
Кастомный статусбар с отображением затрат, использования контекста и git-ветки с цветовой индикацией.

## Установка

### Установить один скилл

Скажите агенту:

> Install this skill: `https://github.com/serejaris/ris-claude-code/tree/main/skills/cc-analytics`

Замените `cc-analytics` на имя любого скилла из таблицы выше.

### Установить все скиллы (плагин)

**Claude Code Desktop:** **+** → **Plugins** → найти `ris-claude-code` → **Install**

**Claude Code CLI:** `/plugin` → **Marketplaces** → **Add** → `serejaris/ris-claude-code` → **Discover** → **Install**

### Вручную

Скиллы — обычные markdown-файлы. Скопируйте `skills/<name>/SKILL.md` в `~/.claude/skills/<name>/`.

## Автор

- Telegram: [@ris_ai](https://t.me/ris_ai) — AI-разработка и вайбкодинг
- YouTube: [@serejaris](https://www.youtube.com/@serejaris)
- [vibecoding.phd](https://vibecoding.phd)

## Лицензия

MIT
