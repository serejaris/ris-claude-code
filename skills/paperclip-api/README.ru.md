# paperclip-api

Управление компаниями AI-агентов [Paperclip](https://github.com/paperclipai/paperclip) из Claude Code — создание задач, управление агентами, одобрение наймов, запуск heartbeat. Без браузера.

## Что делает

Paperclip — open-source оркестратор для автономных компаний AI-агентов. Скилл даёт полный контроль через CLI и REST API:

- **Issues** — создание, назначение, комментирование, смена приоритета/статуса
- **Агенты** — список, пауза/возобновление, смена модели/промпта/бюджета, запуск heartbeat
- **Одобрения** — список ожидающих, одобрение/отклонение наймов и стратегий
- **Компании** — создание, обновление бюджета, архивация
- **Инструкции** — редактирование промптов агентов напрямую как markdown-файлы

## Требования

- [Paperclip](https://github.com/paperclipai/paperclip) запущен локально (`npx paperclipai onboard --yes`)
- Node.js 20+ и pnpm 9.15+

## Быстрые примеры

```bash
# Создать задачу
pnpm paperclipai issue create --title "Audit SEO" --priority high

# Список агентов
pnpm paperclipai agent list

# Одобрить ожидающие наймы
pnpm paperclipai approval approve <id>

# Или использовать REST API напрямую
curl -X POST http://127.0.0.1:3101/api/companies/{companyId}/issues \
  -H "Content-Type: application/json" \
  -d '{"title": "Audit SEO", "priority": "high"}'
```

## Ссылки

- [Документация Paperclip](https://docs.paperclip.ing)
- [Обзор API](https://docs.paperclip.ing/api/overview)
- [CLI-команды](https://docs.paperclip.ing/cli/control-plane-commands)
