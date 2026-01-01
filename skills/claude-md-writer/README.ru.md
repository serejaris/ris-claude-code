# Claude MD Writer Skill

Скилл для создания и рефакторинга CLAUDE.md файлов по лучшим практикам Anthropic.

## Проблема

CLAUDE.md файлы разрастаются, тратят токены на каждый запрос, не используют условную загрузку.

## Решение

Стандарты документации:
- **Лимиты размера** — CLAUDE.md < 200 строк, rules < 500 строк
- **3-уровневая система** — Foundation → Component → Feature
- **Условная загрузка** — `paths:` frontmatter для file-specific правил
- **Иерархия памяти** — понимание приоритетов загрузки

## Установка

```bash
cp -r skills/claude-md-writer ~/.claude/skills/
```

## Краткий справочник

| Лимит | Цель |
|-------|------|
| CLAUDE.md | < 200 строк |
| Каждый rules файл | < 500 строк |
| Критичные правила | Вверху файла |

### 3-уровневая система

| Уровень | Расположение | Загрузка |
|---------|--------------|----------|
| Foundation | `CLAUDE.md` | Всегда |
| Component | `.claude/rules/` | При работе с компонентом |
| Feature | Рядом с кодом | При работе с фичей |

## Ключевые фичи

- Таблица golden rules с лимитами
- 3-уровневая система документации
- Glob-паттерны для условных правил
- Объяснение иерархии памяти
- Чеклист качества
- Гайд по типичным ошибкам

## См. также

- [Memory docs](https://code.claude.com/docs/en/memory)
- [Best practices](https://anthropic.com/engineering/claude-code-best-practices)
- [Using CLAUDE.md](https://claude.com/blog/using-claude-md-files)
