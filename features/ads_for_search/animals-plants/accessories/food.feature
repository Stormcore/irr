# language:ru
# encoding: utf-8
Функционал: Животные и растения -> Аксессуары -> Корма и добавки

  Контекст:
    Когда открыта страница для региона "Усть-Алтан"
        * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу к подаче объявления
        * я подаю объявление в категорию "Животные и растения -> Аксессуары -> Корма и добавки"

  Сценарий: Объявление 1
   Когда я ввожу следующие данные на шаге 2:
          | parameter          | value                 |
          | Тип предложения    | продам                |
          | Заголовок          | Продаю корм для кошек |
          | Цена               | 15000                 |
          | Валюта             | руб.                  |
          | Тип животного      | кошки                 |
          | Текст              | Продаю корм для кошек |
       * я загружаю фото на шаге 2
       * я перехожу на шаг 3
      То в ЛК ИП открыт список объявлений пользователя

  Сценарий: Объявление 2
   Когда я ввожу следующие данные на шаге 2:
          | parameter          | value                  |
          | Тип предложения    | продам                 |
          | Заголовок          | Продаю пищевые добавки |
          | Цена               | 100                    |
          | Валюта             | $                      |
          | Тип животного      | собаки                 |
          | Текст              | Продаю пищевые добавки |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
      То в ЛК ИП открыт список объявлений пользователя
