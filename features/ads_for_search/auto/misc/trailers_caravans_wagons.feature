# language:ru
# encoding: utf-8
Функционал: Авто и мото -> Мототехника и Автодома -> Автодома и легковые прицепы

  Контекст:
    Когда открыта страница для региона "Усть-Алтан"
        * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу к подаче объявления
        * я подаю объявление в категорию "Авто и мото -> Мототехника и Автодома -> Автодома и легковые прицепы"

  Сценарий: Объявление 1
   Когда я ввожу следующие данные на шаге 2:
          | parameter             | value                   |
          | Заголовок             | Продаю трейлер для дачи |
          | Цена                 | 15000                   |
          | Валюта                | руб.                    |
          | Новый или подержанный | новый                   |
          | Год выпуска           | 2000                    |
          | Тип предложения       | продам                  |
          | Текст                 | Продаю трейлер для дачи |
       * я ввожу следующие данные на шаге 2 в секции "Кузов":
          | parameter                | value |
          | Объем внешнего багажника | 20    |
       * я загружаю фото на шаге 2
       * я перехожу на шаг 3
        * на шаге 3 нет ошибок
      То в ЛК ИП открыт список объявлений пользователя

  Сценарий: Объявление 2
   Когда я ввожу следующие данные на шаге 2:
          | parameter             | value          |
          | Заголовок             | Продаю трейлер |
          | Цена                 | 200            |
          | Валюта                | $              |
          | Новый или подержанный | новый          |
          | Год выпуска           | 2000           |
          | Тип предложения       | продам         |
          | Текст                 | Продаю         |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
        * на шаге 3 нет ошибок
      То в ЛК ИП открыт список объявлений пользователя
