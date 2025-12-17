# Gemini tmux Orchestration Skill

Скилл для Claude Code — делегирует задачи агенту Gemini CLI через tmux, позволяя параллельное выполнение с контекстным окном 1M+ токенов.

## Проблема

Gemini CLI в headless режиме (`gemini -p "..."`) не может выполнять shell-команды и писать файлы. Это ограничение дизайна — `--yolo` и `--allowed-tools` не помогают в режиме subprocess.

## Решение

Используй **tmux send-keys** для интерактивного запуска Gemini CLI с программным управлением из Claude Code.

## Структура

```
gemini-tmux-orchestration/
└── SKILL.md    # Основной скилл с командами и workflow
```

## Установка

```bash
cp -r skills/gemini-tmux-orchestration ~/.claude/skills/
```

## Требования

- **tmux** — `brew install tmux` (macOS) или `apt install tmux` (Linux)
- **Gemini CLI** — `npm install -g @google/gemini-cli`
- Claude Code запущен внутри tmux сессии

## Быстрый старт

```bash
# 1. Запусти Gemini в split pane
tmux split-window -h -d "cd ~/project && gemini --yolo"

# 2. Отправь задачу (ДВА отдельных вызова!)
tmux send-keys -t {right} 'Build the app per PLAN.md'
tmux send-keys -t {right} Enter

# 3. Проверь прогресс
tmux capture-pane -t {right} -p -S -100 | tail -50
```

## Ключевые фичи

- **Status markers** — детекция состояния Gemini (idle, working, error)
- **Smart polling** — ожидание завершения вместо фиксированного sleep
- **Loop detection** — авто-ответ на запросы Gemini о зацикливании
- **Custom commands** — `.gemini/commands/` для переиспользуемых задач

## Типичные ошибки

| Ошибка | Исправление |
|--------|-------------|
| `send-keys 'text' Enter` вместе | Enter не регистрируется — отправляй отдельно |
| Чейнинг bash команд | Команды утекают в ввод Gemini — отдельные вызовы |
| Фиксированный `sleep 60` | Используй polling со status markers |

## Применение

- Сложные задачи с выгодой от контекста 1M+
- Параллельное выполнение пока Claude продолжает работать
- Задачи с Google-интеграциями
- Анализ и рефакторинг больших кодовых баз

## См. также

- [Gemini CLI Documentation](https://geminicli.com/docs/)
- [tmux Manual](https://man7.org/linux/man-pages/man1/tmux.1.html)
