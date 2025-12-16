# API Digest Skill

Скилл для Claude Code — забирает сырые данные из API и генерирует детальные дайджесты без платных LLM-вызовов.

## Структура

```
api-digest/
├── SKILL.md            # Инструкции со ссылками на файлы
├── fetch.sh            # Curl с credentials (изолированы)
└── output-template.md  # Шаблон вывода
```

**Зачем разделение?**
- **Progressive disclosure** — Claude загружает доп. файлы только когда нужно
- **Безопасность** — credentials в отдельном файле
- **Переиспользование** — шаблон вывода можно менять независимо

## Установка

```bash
cp -r skills/api-digest ~/.claude/skills/
chmod +x ~/.claude/skills/api-digest/fetch.sh
```

## Настройка

### 1. Отредактируй `fetch.sh`

Замени плейсхолдеры на свои значения:

```bash
API_URL="https://your-api.com"
RESOURCE_ID="123"
USER="your-username"
PASS="your-password"
LIMIT=400
```

**Альтернативные способы авторизации:**

```bash
# Bearer token
curl -s -H "Authorization: Bearer $TOKEN" "$API_URL/items"

# API key
curl -s -H "X-API-Key: $KEY" "$API_URL/items"
```

### 2. Настрой триггеры (опционально)

Измени description в `SKILL.md` чтобы добавить свои триггер-слова:

```yaml
description: Use when user asks for digest ("дайджест", "мой-триггер")
```

### 3. Измени шаблон вывода (опционально)

Отредактируй `output-template.md` под свои нужды.

## Использование

После установки триггерится фразами:
- "дайджест" / "digest"
- "саммари" / "summary"
- "что нового" / "what's new"

## Применение

- **Дайджесты чатов**: Telegram, Slack, Discord
- **Саммари тикетов**: Jira, Linear, GitHub Issues
- **Анализ логов**: Application logs, audit trails
- **Треды комментариев**: PR reviews, форумы

## Безопасность

- Credentials локально в `fetch.sh`
- Не коммить настроенные скиллы с реальными credentials
- Используй read-only токены где возможно
