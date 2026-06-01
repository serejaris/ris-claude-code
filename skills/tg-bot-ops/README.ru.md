# Telegram Bot Ops Skill

Скилл для операционной работы с Telegram-ботами и Telegram-to-agent gateways: найти, почему бот не отвечает, проверить webhook или polling, посмотреть логи, проверить env, сделать безопасный smoke test и подготовить restart/deploy без раскрытия токенов.

Telegram-to-agent gateway — это runtime, где Telegram update запускает agent
turn, а gateway отправляет ответ агента обратно в Telegram. Переиспользуемая
цепочка доказательств: update доставлен, runtime turn стартовал, outbound reply
отправлен, ответ виден в нужном чате или topic.

## Когда использовать

- Telegram-бот перестал отвечать.
- Telegram-to-agent gateway не получает или не отвечает на сообщения в группе/topic.
- Нужно проверить webhook vs polling.
- Telegram updates не доходят до runtime.
- Бот должен отвечать в группе, канале или forum topic.
- Нужен безопасный план restart/deploy.
- Нужен incident summary с доказательствами и next steps.

## Когда не использовать

- Написать пост в канал.
- С нуля разработать новую bot feature.
- Анализировать аудиторию или контент Telegram.
- Отправлять production-сообщения без явного разрешения пользователя.

## Модель безопасности

Скилл по умолчанию работает read-only. `TELEGRAM_BOT_TOKEN`, `.env`, database URLs, сырые логи, приватные DM, payment payloads, session-файлы и user records считаются чувствительными. В публичных отчётах используются placeholders: `<TELEGRAM_BOT_TOKEN>`, `<CHAT_ID>`, `<TOPIC_ID>`.

## Примеры

```text
Telegram bot stopped responding. Diagnose it from this repo.
```

```text
Check whether this bot is using webhook or polling and verify the current setup.
```

```text
Review the last deploy logs and tell me why Telegram updates are failing.
```

```text
Prepare a safe restart plan for this Telegram bot on Railway.
```

```text
Run a smoke test using TELEGRAM_BOT_TOKEN from the local environment. Do not print the token.
```

## Что проверяет

- repo, runtime и deployment target бота;
- наличие нужных env vars без печати секретов;
- Bot API identity через `getMe` для Bot API-token runtimes;
- webhook state через `getWebhookInfo` для Bot API-token runtimes;
- session auth, connected client, update handler registration и process logs для
  Telethon/MTProto runtimes;
- единственного update owner в Bot API polling mode;
- delivery в forum topics через `message_thread_id`;
- privacy mode и group visibility;
- Telegram-to-agent routing от Telegram update к agent runtime и исходящему ответу;
- runtime logs и outbound send evidence;
- public-safe incident summary.

## Установка

```bash
cp -r skills/tg-bot-ops ~/.claude/skills/
```

## См. также

- [SKILL.md](SKILL.md) — полное описание скилла
- [references/hermes-gateway.md](references/hermes-gateway.md) — переиспользуемый Hermes-compatible gateway checklist
