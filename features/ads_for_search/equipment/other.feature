# language:ru
# encoding: utf-8
Функционал: Оборудование -> Другое

  Контекст:
    Когда открыта страница для региона "Усть-Алтан"
        * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу к подаче объявления

  Сценарий: Объявление 1
   Когда я подаю объявление в категорию "Оборудование -> Другое"
       * я ввожу следующие данные на шаге 2:
          | parameter         | value                      |
          | Тип предложения   | продам                     |
          | Заголовок         | Продаю другое оборудование |
          | Состояние         | новый                      |
          | Цена:             | 15000                      |
          | Валюта            | руб.                       |
          | Текст             | Продаю всякое оборудование |
       * я загружаю фото на шаге 2
       * я перехожу на шаг 3
      То открыт список объявлений пользователя

  Сценарий: Объявление 2
   Когда я подаю объявление в категорию "Оборудование -> Другое"
       * я ввожу следующие данные на шаге 2:
          | parameter         | value                   |
          | Тип предложения   | продам                  |
          | Заголовок         | Продаю еще оборудование |
          | Состояние         | б/у                     |
          | Цена:             | 1000                    |
          | Валюта            | $                       |
          | Текст             | Продаю всякое оборудование |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
      То открыт список объявлений пользователя
