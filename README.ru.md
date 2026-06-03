# Personal Corp Skills

[![en](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![ru](https://img.shields.io/badge/lang-ru-green.svg)](README.ru.md)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Validate](https://github.com/serejaris/personal-corp-skills/actions/workflows/validate.yml/badge.svg)](https://github.com/serejaris/personal-corp-skills/actions/workflows/validate.yml)

> Публичные skills и plugin manifests для Claude Code и Codex: Personal Corp, продуктовая работа, AI-операции и агентная разработка.

От [Ris](https://t.me/ris_ai) — пишу про AI-разработку и вайбкодинг

Коллекция санитизированных публичных скиллов, скриптов и воркфлоу для [Claude Code](https://docs.anthropic.com/en/docs/claude-code) и Codex.

## Установка

### Claude Code

В терминале:

```bash
claude plugin marketplace add serejaris/personal-corp-skills
claude plugin install personal-corp-skills@personal-corp-skills
claude plugin details personal-corp-skills
```

В Claude Code Desktop или interactive `/plugin` flow:

1. Откройте **Plugins** или `/plugin`.
2. Добавьте marketplace: `serejaris/personal-corp-skills`.
3. Установите `personal-corp-skills`.

### Codex

В репозитории есть Codex manifest: [.codex-plugin/plugin.json](.codex-plugin/plugin.json).
Добавьте marketplace из GitHub, затем установите плагин:

```bash
codex plugin marketplace add serejaris/personal-corp-skills
codex plugin add personal-corp-skills@personal-corp-skills
```

После установки откройте новый Codex thread и проверьте:

```text
Use Personal Corp skills to plan my week.
```

### Один скилл

Используйте этот вариант, если нужна одна папка скилла:

> Install this skill: `https://github.com/serejaris/personal-corp-skills/tree/main/skills/cc-analytics`

Замените `cc-analytics` на имя любого скилла из таблицы ниже.

## Skills

| Скилл | Что делает |
|-------|-----------|
| [art-director](./skills/art-director/) | Итеративный поиск визуального стиля с промптами, журналом процесса, ассетами и графами решений |
| [product-data-audit](./skills/product-data-audit/) | Глубокий аудит продукта/бизнеса — интерактивный HTML-отчёт на 12 секций |
| [cc-analytics](./skills/cc-analytics/) | HTML-отчёты статистики использования Claude Code |
| [ceo-council](./skills/ceo-council/) | Параллельные субагенты в роли C-level экспертов для стратегического анализа |
| [claude-md-writer](./skills/claude-md-writer/) | Создание и рефакторинг CLAUDE.md по best practices |
| [corp-new](./skills/corp-new/) | Добавление приватного corp-* репозитория отдела и HQ-записи после подтверждения |
| [design-minimal](./skills/design-minimal/) | Одна HTML-страница в минимальном стиле для дашбордов, брифов, раздаток и отчётов |
| [gh-issues](./skills/gh-issues/) | Управление GitHub Issues через CLI с хранением контекста сессий |
| [meeting-copilot](./skills/meeting-copilot/) | Live dashboard для встреч: подготовка, обновление из транскрипта, закрытие с решениями и follow-up |
| [readme-generator](./skills/readme-generator/) | Человеко-ориентированные README с правильной структурой |
| [manager](./skills/manager/) | Двусторонний мост между текущей сессией и GitHub Issues |
| [prioritize](./skills/prioritize/) | Ранжирование бэклогов через RICE, ICE, MoSCoW или Kano |
| [html-draft](./skills/html-draft/) | Одна HTML-диаграмма в стиле плоского инженерного чертежа — архитектура, потоки, spec sheets |
| [tg-bot-ops](./skills/tg-bot-ops/) | Переиспользуемый операционный плейбук для Telegram-ботов и Telegram-to-agent gateways |

### Дизайн и медиа

| Скилл | Когда использовать |
|-------|--------------------|
| [art-director](./skills/art-director/) | Итеративный art direction, поиск визуального стиля, ветки генерации и графы решений |
| [design-minimal](./skills/design-minimal/) | Читаемые standalone HTML-страницы: дашборды, брифы, раздатки, операционные карты, отчёты |
| [html-draft](./skills/html-draft/) | Технические диаграммы в стиле плоского инженерного чертежа: архитектура, system flows, spec sheets |

### Telegram

| Скилл | Когда использовать |
|-------|--------------------|
| [tg-bot-ops](./skills/tg-bot-ops/) | Инциденты Telegram-ботов и Telegram-to-agent gateways, webhook/polling diagnostics, безопасный restart, Bot API smoke tests, delivery в forum topics |

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
| [corp-new](./skills/corp-new/) | Регистрация приватного corp-* репозитория отдела и HQ-записи после подтверждения |
| [task-routing](./skills/task-routing/) | Маршрутизация issues в правильный репо через конфиг |
| [weekly-planning](./skills/weekly-planning/) | Ретро + бэклог — приоритизированные outcomes с матрицей Эйзенхауэра |
| [weekly-retro](./skills/weekly-retro/) | Структурированное ретро: сбор данных, интервью с основателем, фиксация в issues |
| [manager](./skills/manager/) | Синк работы сессии в GitHub Issues и cross-repo запросы по задачам |
| [prioritize](./skills/prioritize/) | Ранжирование требований и бэклогов перед планированием |

## Other

### [Statusline](./statusline/)
Кастомный статусбар с отображением затрат, использования контекста и git-ветки с цветовой индикацией.

## Архивные скиллы

Архивные скиллы сохраняются для справки и не входят в активный набор скиллов
плагина.

| Скилл | Примечание |
|-------|------------|
| [paperclip-api](./archive/skills/paperclip-api/) | Исторический helper для Paperclip API; сохранён для справки |

## Ручная установка

Скиллы — обычные папки. Копируйте всю папку скилла, чтобы не потерять optional
references и examples:

```bash
cp -r skills/<name> ~/.claude/skills/
```

## Автор

- Telegram: [@ris_ai](https://t.me/ris_ai) — AI-разработка и вайбкодинг
- YouTube: [@serejaris](https://www.youtube.com/@serejaris)
- [vibecoding.phd](https://vibecoding.phd)

## Лицензия

MIT

## Безопасность

Секреты, утечки приватных данных и exploitable behavior отправляйте приватно.
См. [SECURITY.md](SECURITY.md).
