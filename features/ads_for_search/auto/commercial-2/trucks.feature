# language:ru
# encoding: utf-8
Функционал: Авто и мото -> Коммерческий транспорт -> Средние и тяжелые грузовики

  Контекст:
    Когда открыта страница для региона "Усть-Алтан"
        * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу к подаче объявления
        * я подаю объявление в категорию "Авто и мото -> Коммерческий транспорт -> Средние и тяжелые грузовики"

  Сценарий: Объявление 1
   Когда я ввожу следующие данные на шаге 2:
          | parameter                | value            |
          | Марка                    | Mercedes         |
          | Модель                   | Actros           |
          | Заголовок                | Продаю самосвал  |
          | Цена                     | 15000            |
          | Валюта                   | руб.             |
          | Новый или подержанный    | новый            |
          | Год выпуска              | 2000             |
          | Тип трансмиссии          | механическая     |
          | Пробег                   | 30000            |
          | Мощность двигателя, л.с. | 400              |
          | Тип кузова               | седельный тягач  |
          | Тип топлива              | дизель           |
          | Грузоподъемность         | 40               |
          | Текст                    | Продаю самосвал  |
       * я загружаю фото на шаге 2
       * я перехожу на шаг 3
      То в ЛК ИП открыт список объявлений пользователя
       * в ЛК ИП я выбираю пакет "NEW Авто | ВСЕ РЕГИОНЫ"
       * в ЛК ИП объявление с названием "Продаю самосвал" присутствует в списке
       * я делаю данное объявление премиумом на 14 дней

  Сценарий: Объявление 2
   Когда я ввожу следующие данные на шаге 2:
          | parameter                | value           |
          | Марка                    | Ford            |
          | Модель                   | F550            |
          | Заголовок                | Продаю тягач    |
          | Цена                     | 200             |
          | Валюта                   | $               |
          | Новый или подержанный    | новый           |
          | Год выпуска              | 2000            |
          | Тип трансмиссии          | автоматическая  |
          | Пробег                   | 30000           |
          | Мощность двигателя, л.с. | 400             |
          | Тип кузова               | седельный тягач |
          | Тип топлива              | дизель          |
          | Грузоподъемность         | 40              |
          | Текст                    | Продаю          |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
      То в ЛК ИП открыт список объявлений пользователя
