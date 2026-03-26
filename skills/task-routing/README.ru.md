# Скилл Task Routing

Скилл Claude Code для маршрутизации issues в правильный репозиторий через конфиг из CLAUDE.md. Часть фреймворка Personal Corp.

## Проблема

В мульти-репо сетапе issues создаются не там — задачи по боту в стратегическом репо, личные ops-задачи в публичных репо, дубликаты по проектам.

## Решение

Читает секцию `### Task Routing` из CLAUDE.md (созданную `project-init`) и матчит ключевые слова задачи с правильным целевым репозиторием.

## Установка

```bash
cp -r skills/task-routing ~/.claude/skills/
```

## Как работает

1. Читает routing patterns из CLAUDE.md
2. Матчит описание задачи → целевой репо
3. Проверяет дубликаты в целевом репо и едином проекте
4. Проверяет наличие W-label (никогда не создаёт — это работа `weekly-planning`)
5. Создаёт issue в правильном репо

## Часть фреймворка Personal Corp

```
project-init → task-routing → weekly-planning / weekly-retro
     ↑               ↑              ↑
 (настройка)   (ежедневная)    (недельный цикл)
```

## Связанные скиллы

- [project-init](../project-init/) — создаёт routing конфиг
- [weekly-planning](../weekly-planning/) — создаёт W-labels и приоритизирует
- [weekly-retro](../weekly-retro/) — создаёт бэклог из ретро
