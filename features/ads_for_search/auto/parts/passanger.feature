# language:ru
# encoding: utf-8
Функционал: Авто и мото -> Автозапчасти и принадлежности -> Для легковых автомобилей

  Контекст:
    Когда открыта страница для региона "Усть-Алтан"
        * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу к подаче объявления
        

  Сценарий: Объявление 1
   Когда я подаю объявление в категорию "Авто и мото -> Автозапчасти и принадлежности -> Для легковых автомобилей -> Запчасти для легковых автомобилей"
       * я ввожу следующие данные на шаге 2:
          | parameter          | value                     |
          | Марка              | Daewoo                    |
          | Заголовок          | Тест подачи объявления 1  |
          | Цена:              | 15000                     |
          | Валюта             | руб.                      |
          | Тип предложения    | продам                    |
          | Текст              | Продаю диски              |
       * я загружаю фото на шаге 2
       * я перехожу на шаг 3
      То открыт список объявлений пользователя

  Сценарий: Объявление 2
   Когда я подаю объявление в категорию "Авто и мото -> Автозапчасти и принадлежности -> Для легковых автомобилей -> Автосигнализация"
       * я ввожу следующие данные на шаге 2:
          | parameter          | value                     |
          | Заголовок          | Тест подачи объявления 2 (квадроцикл) |
          | Цена:              | 200                       |
          | Валюта             | $                         |
          | Текст              | Продаю                    |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
      То открыт список объявлений пользователя

  Сценарий: Объявление 3
   Когда я подаю объявление в категорию "Авто и мото -> Автозапчасти и принадлежности -> Для легковых автомобилей -> Ксенон"
       * я ввожу следующие данные на шаге 2:
          | parameter          | value                     |
          | Заголовок          | Тест подачи объявления 3  |
          | Цена:              | 15000                     |
          | Валюта             | руб.                      |
          | Тип предложения    | продам                    |
          | Текст              | Продаю диски              |
       * я загружаю фото на шаге 2
       * я перехожу на шаг 3
      То открыт список объявлений пользователя

  Сценарий: Объявление 4
   Когда я подаю объявление в категорию "Авто и мото -> Автозапчасти и принадлежности -> Для легковых автомобилей -> Автомобильные аккумуляторы"
       * я ввожу следующие данные на шаге 2:
          | parameter          | value                     |
          | Заголовок          | Тест подачи объявления 4  |
          | Цена:              | 200                       |
          | Валюта             | $                         |
          | Текст              | Продаю                    |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
      То открыт список объявлений пользователя