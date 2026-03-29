# HTML-визуализация: дизайн-спецификация

## Тема: Swiss Precision (светлая, бруталистская редакционная)

Шрифты (Google Fonts): IBM Plex Mono (лейблы, теги, числа), Cormorant Garamond (заголовки, номера секций), Instrument Sans (текст).

## Палитра

```css
:root {
  --cream: #f5f0e8; --paper: #faf8f4; --ink: #1a1a18; --ink-light: #4a4a45; --ink-faint: #8a8a82;
  --rule: #d4cfc4; --vermillion: #d42b1e;
  --forest: #1a6b3c; --forest-light: rgba(26,107,60,0.07);
  --amber: #b5750d; --amber-light: rgba(181,117,13,0.07);
}
```

## Структура

- **Nav bar** (56px, fixed top, чёрный фон): лого "АУДИТ", 12 nav-ссылок (00–11), легенда цветов справа
- **Hero**: дата + H1 (Cormorant 52px) + подзаголовок (1-2 предложения — главный вывод аудита)
- **Методология** (серый блок сразу после hero, до оглавления): "Агент прочитал N файлов проекта, нашёл данные, системы, решения и узкие места. Проверил 18 операционных артефактов. Каждый вывод протегирован: ФАКТ / ГИПОТЕЗА / НЕИЗВЕСТНО — с источником." Без имени автора. Кликабельная ссылка на скилл: `Скилл: <a href="https://github.com/serejaris/ris-claude-code/tree/main/skills/product-data-audit">Product & Data Audit</a>`.
- **Оглавление** (после методологии): компактный grid 3-4 колонки, якорные ссылки на все 12 секций. Формат: номер + название. IBM Plex Mono 11px, ink-faint, при hover — ink.
- **Секция 0: SVG-диаграмма** (см. ниже)
- **12 секций (0–11)**: section-n (Cormorant 64px, vermillion) + section-title (Cormorant 28px) + intro (1-2 предложения, ink-faint, 13px)

## Компоненты

| Компонент | Секции | Паттерн |
|-----------|--------|---------|
| **SVG-диаграмма экосистемы** | 0 | 4 горизонтальных слоя, ноды с числами, ортогональные стрелки |
| tagged-item со structured fact | 1, 2 | Штамп слева + 3-уровневая структура: claim → metrics pills → source |
| table-wrapper > table | 2, 3, 4, 5, 11 | Чёрный thead, IBM Plex Mono заголовки, hover строк |
| bottleneck-card (severity crit/med) | 6 | Grid 2 кол, shadow offset при hover, крупный номер фоном |
| contour-card | 7 | Top: название + приоритет. Блок "зачем" + "сейчас" (контекст). Grid 2 кол (авто/человеку). Risk bar |
| priority-timeline | 8 | Вертикальная линия, квадратные dot (now=зелёный, next=янтарный, later=серый) |
| one-hour-box | 8 | Border vermillion 2px, label "ЕСЛИ БЫ БЫЛ 1 ЧАС" как ::before на фоне cream |
| unknown-item | 9 | Border-left 3px vermillion, фон vermillion-light, знак "?" (Cormorant 24px) |
| question-card | 10 | Grid 2 кол, номер (IBM Plex Mono, vermillion) + текст, shadow offset hover |

## Секция 0: SVG-диаграмма экосистемы

ViewBox: `0 0 980 580`. Фон: `#faf8f4`, border: `#d4cfc4`.

### 4 горизонтальных слоя

| Слой | Y | Высота | Фон | Цвет рамок нод | Лейбл |
|------|---|--------|-----|-----------------|-------|
| 01 Ядро выручки | 40 | 130 | forest 3% | forest 2px (solid) | forest |
| 02 Удержание и рост | 170 | 120 | amber 2% | amber 1.5px | amber |
| 03 Медиа и доверие | 290 | 110 | slate 2% | rule 1px | slate |
| 04 Операционный контур | 400 | 180 | vermillion 2% | vermillion 1px | vermillion |

Ноды-прямоугольники: белый фон (#fff), скругление 3px. Пунктирный stroke рамки = гипотеза/зарождающееся. Без стрелок между нодами — они плохо рендерятся. Связи между слоями объясняются текстом в блоке "РАЗРЫВЫ".

Каждая нода содержит:
- Название (Instrument Sans 13-15px, bold)
- Метрики (IBM Plex Mono 9-10px, ink-light)
- Источник (IBM Plex Mono 7-8px, ink-faint)

### Блок "РАЗРЫВЫ"

Внизу SVG (y=500): rect с красным пунктиром, перечисление 2-3 главных дефицитов данных.

## Structured Facts (секции 1, 2)

Каждый тегированный элемент (ФАКТ/ГИПОТЕЗА/НЕИЗВЕСТНО) имеет 3 уровня внутри:

1. **fact-claim** — тезис, одно предложение, 15px, font-weight 500
2. **fact-metrics** — горизонтальные пилюли-бейджи, flex-wrap. Каждая: IBM Plex Mono 12px, фон rgba(ink, 0.04), padding 3px 8px. Ключ bold, значение regular
3. **fact-source** — IBM Plex Mono 10px, ink-faint, внизу

Не сливать всё в один абзац. Тезис читается отдельно, числа сканируются визуально, источник не мешает.

## JavaScript

1. IntersectionObserver для подсветки активной секции в навигации
2. Scroll-анимация появления (opacity 0→1, translateY 16→0, transition 0.45s)

## Responsive

< 768px: nav минимизирован, container padding 20px, grids → 1 колонка, hero h1 32px.
