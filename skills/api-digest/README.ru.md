# API Digest Skill

Скилл для Claude Code, который забирает сырые данные из любого API и генерирует детальные дайджесты — без платных LLM-вызовов на бэкенде.

## Зачем это нужно

Вместо:
```
Бэкенд → LLM API ($) → Короткое саммари → Пользователь
```

Делаем:
```
Claude Code → Твой API (бесплатно) → Детальный анализ → Пользователь
```

Claude обрабатывает сырые данные напрямую — получаешь более богатый вывод без доп. затрат.

## Установка

1. Скопируй папку скилла в директорию скиллов Claude:

```bash
cp -r skills/api-digest ~/.claude/skills/
```

2. Отредактируй `~/.claude/skills/api-digest/SKILL.md`:
   - Замени curl-команду на свой реальный API endpoint
   - Добавь авторизацию (токен, basic auth и т.д.)
   - Подправь имена полей под свой API

3. Перезапусти Claude Code или начни новую сессию

## Конфигурация

### Примеры авторизации

**Bearer Token:**
```bash
curl -s -H "Authorization: Bearer abc123" "https://api.example.com/messages"
```

**Basic Auth:**
```bash
curl -s -u "user:pass" "https://api.example.com/messages"
```

**API Key в заголовке:**
```bash
curl -s -H "X-API-Key: abc123" "https://api.example.com/messages"
```

### Маппинг полей API

Скилл ожидает JSON с items, содержащими текст и автора. Частые варианты полей:

| Ожидается | Альтернативы |
|-----------|-------------|
| `text` | `content`, `message`, `body` |
| `author` | `user`, `username`, `sender`, `from` |
| `created_at` | `timestamp`, `date`, `time` |

Обнови инструкции в SKILL.md, если твой API использует другие имена полей.

## Использование

После установки триггерится естественным языком:

- "дайджест" / "digest"
- "саммари" / "summary"
- "что нового" / "what's new"

Claude:
1. Выполнит curl-команду
2. Распарсит ответ
3. Сгенерирует структурированный дайджест

## Кейсы использования

- **Дайджесты чатов**: Telegram, Slack, Discord экспорты
- **Саммари тикетов**: Jira, Linear, GitHub Issues
- **Анализ логов**: Application logs, audit trails
- **Треды комментариев**: PR reviews, форумы
- **Новостные ленты**: RSS агрегаторы, уведомления

## Безопасность

- Храни credentials в файле скилла (он локальный на твоей машине)
- Не коммить настроенные скиллы с реальными credentials
- Используй read-only токены где возможно
