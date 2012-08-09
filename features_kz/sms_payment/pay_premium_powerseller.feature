# language:ru
# encoding: utf-8
Функционал: ИП - Премиум - Авто с пробегом

  Контекст:
    Когда открыта страница для региона "Актобе"

@advert_submit
  Сценарий: Подача объявления
   Когда я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" с параметрами:
          | parameter        | value          |
          | Марка            | Audi           |
          | Модель           | A3             |
          | Цена:            | 30000          |
          | Валюта           | $              |
          | Год выпуска      | 1993           |
          | Тип кузова       | кабриолет      |
          | Тип трансмиссии  | автоматическая |
          | Текст            | Продаю ауди    |
       * я перехожу на шаг 3
      То открыт список объявлений пользователя
       * объявление с названием "Audi A3,  кабриолет,  1993 г. в.,  автоматическая" присутствует в списке
       * я делаю данное объявление премиумом
   Когда на странице оплаты я выбираю SMS
       * я перехожу на БО
       * я отсылаю SMS для оплаты
       * открыта страница для региона "Актобе"
       * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я перехожу в список моих объявлений
      То объявление с названием "Audi A3,  кабриолет,  1993 г. в.,  автоматическая" присутствует в списке
       * в ЛК ИП данное объявление является премиумом

@after_index
  Сценарий: Проверка индексации
   Когда на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом"
       * я делаю поиск по следующим параметрам:
          | parameter | value           |
          | Марка     | Audi            |
          | Модель    | A3              |
          | Поданные  | вчера и сегодня |
       * на странице поиска загружен список результатов
       * в списке премиумов присутствует объявление "Audi A3,  кабриолет,  1993 г. в.,  автоматическая"
