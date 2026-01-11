# GitHub Issues CLI Skill

Скилл для Claude Code — эффективное управление GitHub Issues через `gh` CLI с хранением AI-контекста сессий.

## Проблема

Управление issues через веб-интерфейс медленное. AI-ассистенты теряют контекст между сессиями, требуя повторных объяснений.

## Решение

- Полный справочник `gh issue` CLI с паттернами JSON/jq
- Массовые операции и продвинутые фильтры поиска
- **Хранение AI-контекста сессий** — сохранение/загрузка состояния работы в комментариях issue
- Воркфлоу задач с лейблами (backlog → in-progress → done)

## Установка

```bash
cp -r skills/gh-issues ~/.claude/skills/
```

## Краткий справочник

### Основные команды

| Задача | Команда |
|--------|---------|
| Создать issue | `gh issue create -t "Title" -b "Body" -l bug` |
| Активные задачи | `gh issue list -l in-progress -s open` |
| Просмотр в JSON | `gh issue view 123 --json number,title,body` |
| Закрыть с комментарием | `gh issue close 123 -c "Fixed in #456"` |
| Создать ветку | `gh issue develop 123 --checkout` |

### Воркфлоу AI-контекста

```bash
# Сохранить контекст в issue
gh issue comment 45 --body-file .ai-context.md

# Загрузить контекст из issue
gh issue view 45 --json comments --jq '
  .comments[] | select(.body | contains("AI-CONTEXT")) | .body
'
```

### Лейблы задач

| Лейбл | Значение |
|-------|----------|
| `backlog` | В очереди |
| `in-progress` | В работе |
| `blocked` | Заблокировано |
| `review` | На ревью |

## Ключевые фичи

- Паттерны JSON-вывода для скриптов
- Массовые операции (редактирование/закрытие нескольких issues)
- Воркфлоу Issue → Branch → PR
- Шаблоны AI-контекста сессий
- Управление задачами через лейблы

## См. также

- [Документация GitHub CLI](https://cli.github.com/manual/)
- [Шаблон контекста](references/context-template.md)
