# Git Workflow Manager Skill

Скилл для Claude Code — обеспечивает консистентные git-воркфлоу: conventional commits, semantic versioning, ведение changelog и release notes.

## Проблема

Непоследовательные коммит-сообщения, произвольные версии и разный формат release notes делают историю проекта сложной для навигации и автоматизации.

## Решение

Стандартизированные воркфлоу:
- **Conventional Commits** — структурированные коммит-сообщения
- **Semantic Versioning** — предсказуемое повышение версий
- **Keep a Changelog** — консистентный формат changelog
- **Release Notes** — единый формат GitHub релизов

## Установка

```bash
cp -r skills/git-workflow-manager ~/.claude/skills/
```

## Краткий справочник

### Типы коммитов

| Тип | Описание | Версия |
|-----|----------|--------|
| `feat:` | Новая фича | MINOR (1.x.0) |
| `fix:` | Баг-фикс | PATCH (1.0.x) |
| `feat!:` | Breaking change | MAJOR (x.0.0) |
| `docs:` | Документация | — |
| `refactor:` | Рефакторинг | — |
| `chore:` | Поддержка | — |

### Воркфлоу релиза

```bash
# 1. Проверить коммиты с последнего релиза
git log $(git describe --tags --abbrev=0)..HEAD --oneline

# 2. Обновить CHANGELOG.md

# 3. Закоммитить, тегнуть, запушить
git add CHANGELOG.md
git commit -m "docs: update changelog for v1.3.0"
git tag -a v1.3.0 -m "Release v1.3.0"
git push && git push --tags

# 4. Создать GitHub релиз
gh release create v1.3.0 --title "v1.3.0 — Название фичи"
```

### Формат тайтла релиза

```
v1.3.0 — Краткое описание
```

## Ключевые фичи

- Валидация коммит-сообщений
- Автоматический расчёт версии
- Шаблон CHANGELOG.md
- Шаблон release notes
- Команды для GitHub релизов

## См. также

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [Keep a Changelog](https://keepachangelog.com/)
