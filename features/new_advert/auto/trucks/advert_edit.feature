# language:ru
# encoding: utf-8
Функционал: Редактирование объявлений - Авто и мото -> Коммерческий транспорт -> Средние и тяжелые грузовики

  Контекст:
    Когда открыта страница для региона "Усть-Алтан"

@advert_submit
  Сценарий: Подача объявления
   Когда я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я перехожу в список моих объявлений
      То в ЛК ИП я запоминаю значение счетчика для категории "Авто и мото -> Коммерческий транспорт -> Средние и тяжелые грузовики"
       * я запоминаю количество объявлений пользователя
       * я запоминаю количество активных объявлений ИП

   Когда я подаю объявление в категорию "Авто и мото -> Коммерческий транспорт -> Средние и тяжелые грузовики" с параметрами:
          | parameter                | value             |
          | Регион                   | Иркутская обл Усть-Ордынский Бурятский округ |
          | Населённый пункт         | Усть-Алтан        |
          | Марка                    | DAF               |
          | Модель                   | FA1900            |
          | Заголовок:               | Продам DAF FA1900 |
          | Цена                     | 10000             |
          | Валюта                   | $                 |
          | Пробег:                  | 10000             |
          | Мощность двигателя, л.с.:| 100               |
          | Новый или подержанный    | новый             |
          | Год выпуска              | 2001              |
          | Тип топлива              | дизель            |
          | Грузоподъемность:        | 10                |
          | Текст                    | Продаю грузовик   |
       * я перехожу на шаг 3
        
      То в ЛК ИП открыт список объявлений пользователя
       * в ЛК ИП объявление с названием "Продам DAF FA1900" присутствует в списке
       * в ЛК ИП счетчик для категории "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" увеличился на 1
       * счетчик объявлений пользователя увеличился на 1
       * счетчик объявлений ИП во всех разделах увеличился на 1
       * счетчик количества размещенных объявлений в ЛК ИП увеличился на 1
       * я запоминаю количество объявлений пользователя
       * я запоминаю количество активных объявлений ИП
       * в ЛК ИП я запоминаю значение счетчика для категории "Авто и мото -> Легковые автомобили -> Автомобили с пробегом"
       * в ЛК ИП объявление с названием "Продам DAF FA1900" присутствует в списке

   Когда я редактирую данное объявление
       * я ввожу следующие данные на шаге 2:
          | parameter                | value           |
          | Марка                    | МАЗ             |
          | Модель                   | 236             |
          | Заголовок:               | Продам МАЗ 236  |
          | Год выпуска              | 2002            |
          | Цена                     | 20000           |
          | Валюта                   | €               |
          | Пробег:                  | 20000           |
          | Мощность двигателя, л.с.:| 200             |
          | Новый или подержанный    | б/у             |
          | Тип топлива              | бензин          |
          | Грузоподъемность:        | 20              |
          | Текст                    | Продаю самосвал |
       * я сохраняю редактируемое объявление
      То в ЛК ИП открыт список объявлений пользователя
       * в ЛК ИП объявление с названием "Продам МАЗ 236" присутствует в списке
       * в ЛК ИП счетчик для категории "Авто и мото -> Коммерческий транспорт -> Средние и тяжелые грузовики" не изменился
       * счетчик объявлений пользователя не изменился
       * счетчик объявлений ИП во всех разделах не изменился
       * счетчик количества размещенных объявлений в ЛК ИП не изменился
       * в ЛК ИП объявление с названием "Продам МАЗ 236" присутствует в списке
    Когда я открываю детали этого объявления
        * счетчик количества активных объявлений продавца не изменился

@advert_submit
  Сценарий: Проверка деталей поданного объявления
    Когда я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу в список моих объявлений
        * в ЛК ИП я выбираю пакет "NEW Авто | ВСЕ РЕГИОНЫ"
       То в ЛК ИП объявление с названием "Продам МАЗ 236" присутствует в списке
        * у объявления указан регион "Иркутская обл Усть-Ордынский Бурятский"
        * у объявления указан город "Усть-Алтан"
        * у объявления указана цена "20000" в евро

    Когда я открываю детали этого объявления
       То на вкладке "Все" "Марка" равно "МАЗ"
        * на вкладке "Все" "Модель" равно "236"
        * на вкладке "Все" "Год выпуска" равно "2002"
        * на вкладке "Все" "Пробег" равно "20000 км"
        * на вкладке "Все" "Мощность двигателя, л.с." равно "200 л.с."
        * на вкладке "Все" "Новый или подержанный" равно "б/у"
        * на вкладке "Все" "Тип топлива" равно "бензин"
        * на вкладке "Все" "Грузоподъемность" равно "20 т"

@after_index
  Сценарий: Проверка индексации
   Когда на главной странице я перехожу в категорию "Авто и мото -> Коммерческий транспорт -> Средние и тяжелые грузовики"
       * я делаю поиск по следующим параметрам:
          | parameter | value           |
          | Марка     | МАЗ             |
          | Модель    | 236             |
          | Поданные  | вчера и сегодня |
       * на странице поиска загружен список результатов
       * в списке обычных объявлений присутствует объявление "Продам МАЗ 236"
