# language:ru
# encoding: utf-8
Функционал: Удаление объявления - Недвижимость -> Аренда (Область)

  Контекст:
    Когда открыта страница для региона "Россия"

@advert_submit
  Сценарий: Удаление объявления
   Когда я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Недвижимость -> Квартиры. Аренда" с параметрами:
          | parameter          | value                     |
          | Регион             | Московская обл            |
          | Населённый пункт   | Пушкино                   |
          | Улица              | Строительная              |
          | Шоссе:             | Ярославское               |
          | Комнат в квартире: | 9                         |
          | Общая площадь:     | 900                       |
          | Этаж:              | 9                         |
          | Цена:              | 900                       |
          | Валюта             | $                         |
          | Текст              | Тест удаления объявления  |
       * я перехожу на шаг 3
      То открыт список объявлений пользователя

@advert_submit
  Сценарий: Проверка деталей поданного объявления
    Когда я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу в список моих объявлений
        * в ЛК ИП я выбираю пакет "NEW [TEST] Недвижимость"
       То объявление с названием "9-комн.  квартира,   Строительная ул,  9,  площадь:  общая 900 кв. м." присутствует в списке

    Когда я удаляю данное объявление
       То объявление с названием "9-комн.  квартира,   Строительная ул,  9,  площадь:  общая 900 кв. м." отсутствует в списке

@after_index
  Сценарий: Проверка индексации
    Когда открыта страница для региона "Пушкино"
        * на главной странице я перехожу в категорию "Недвижимость -> Квартиры. Аренда"
        * я делаю поиск по следующим параметрам:
          | parameter     | value          |
          | Поданные      | сегодня        |
        * на странице поиска загружен список результатов
        * в списке объявлений отсутствует объявление "9 комн, 900 м2, этаж 9"