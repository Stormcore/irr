# language:ru
# encoding: utf-8
Функционал: Недвижимость -> Квартиры. Аренда - подача объявлений в Московскую область

  Контекст:
    Когда открыта страница для региона "Россия"

#@new_advert
  Сценарий: Редактирование объявления
   Когда я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок" с параметрами:
      | parameter                  | value                |
      | Улица                      | Интернациональная    |
      | Дом                        | 10                   |
      | Ближайшее метро            | Белорусская м.       |
      | До метро                   | 5                    |
      | Приватизированная квартира | x                    |
      | Комнат в квартире:         | 1                    |
      | Общая площадь:             | 100                  |
      | Этаж:                      | 4                    |
      | Этажей в здании:           | 8                    |
      | Цена:                      | 100000               |
      | Валюта                     | $                    |
      | Текст                      | Тест редактирования объявления |
     * я перехожу на шаг 3
     * открыт список объявлений пользователя
     * объявление с названием "1-комн.  квартира,   Интернациональная ул,   10,  4/8,  площадь:  общая 100 кв. м.,  приватизированная" присутствует в списке
     * я редактирую данное объявление
     * я ввожу следующие данные на шаге 2:
      | parameter                  | value                |
      | Комнат в квартире:         | 2                    |
      | Общая площадь:             | 200                  |
      | Этаж:                      | 2                    |
      | Этажей в здании:           | 10                   |
      | Цена:                      | 200000               |
     * я сохраняю редактируемое объявление
     * открыт список объявлений пользователя
    То объявление с названием "2-комн.  квартира,   Интернациональная ул,   10,  2/10,  площадь:  общая 200 кв. м.,  приватизированная" присутствует в списке
     * у объявления указан город "Москва"
     * у объявления указана цена "200000" в долларах
 Когда я открываю детали этого объявления
    То на вкладке "Все" "Комнат в квартире" равно "2"
     * на вкладке "Все" "Общая площадь" равно "200 кв. м"
     * на вкладке "Все" "Этаж" равно "2"
     * на вкладке "Все" "Этажей в здании" равно "10"

#@after_index
  Сценарий: Проверка редактирования объявления
   Когда на главной странице я перехожу в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок"
       * на странице поиска загружен список результатов
       * в списке обычных объявлений присутствует объявление "2-комн.  квартира,   Интернациональная ул,   10,  2/10,  площадь:  общая 200 кв. м.,  приватизированная"

#@new_advert
  Сценарий: Выделение объявления
   Когда я подаю объявление в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок" с параметрами:
      | parameter                  | value                |
      | Улица                      | Интернациональная    |
      | Дом                        | 10                   |
      | Ближайшее метро            | Белорусская м.       |
      | До метро                   | 5                    |
      | Приватизированная квартира | x                    |
      | Комнат в квартире:         | 3                    |
      | Общая площадь:             | 300                  |
      | Этаж:                      | 3                    |
      | Этажей в здании:           | 8                    |
      | Цена:                      | 300000               |
      | Валюта                     | $                    |
      | Текст                      | Тест выделения объявления |
     * я перехожу на шаг 3
     * открыт список объявлений пользователя
     * в ЛК ИП я выбираю пакет "NEW [TEST] Недвижимость"
     * объявление с названием "3-комн.  квартира,   Интернациональная ул,   10,  3/8,  площадь:  общая 300 кв. м.,  приватизированная" присутствует в списке
     * в ЛК ИП я запоминаю значение поля "Выделение"
     * я выделяю данное объявление
    То в ЛК ИП значение поля "Выделение" уменьшилось на единицу
     * в ЛК ИП данное объявление выделено
 Когда я открываю детали этого объявления
     * на странице объявления я открываю вкладку "На карте"
    То на странице объявления открыта карта

#@after_index
  Сценарий: Проверка выделения
   Когда на главной странице я перехожу в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок"
       * на странице поиска загружен список результатов
       * в списке обычных объявлений присутствует объявление "3-комн.  квартира,   Интернациональная ул,   10,  3/8,  площадь:  общая 300 кв. м.,  приватизированная"
       * в списке обычных объявлений объявление "3-комн.  квартира,   Интернациональная ул,   10,  3/8,  площадь:  общая 300 кв. м.,  приватизированная" выделено

#@new_advert
  Сценарий: Создание премиума через БО
   Когда я перехожу на БО
       * на БО я перехожу в категорию "Объявления -> Создать премиум"
       * на странице создания нового премиума в БО я выбираю категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок -> Квартиры продажа"
       * при создании премиума я ввожу следующие данные:
      | parameter        | value                  |
      | Регион           | Москва                 |
      | Заголовок        | Тест создания премиума |
      | Текст объявления | Продаю квартиру        |
      | Цена             | 100500                 |
      | Валюта           | $                      |
      | Улица            | Интернациональная      |
      | Дом              | 10                     |
      | Комнат в квартире| 4                      |
      | Общая площадь    | 200                    |
      | Жилая площадь    | 150                    |
      | Площадь кухни    | 25                     |
      | Этаж             | 10                     |
      | Этажей в здании  | 10                     |
      | Санузел          | раздельный             |
      | Балкон/Лоджия    | да                     |
      | Материал стен    | панельный              |
      | Приватизированная квартира | да           |
      | Район города     | Поселок Внуково        |
      | Серия здания     | КОПЭ                   |
      | Высота потолков  | 4                      |
      | Ремонт           | евроремонт             |
      | Система водоснабжения | центральная       |
      | Система отопления     | центральная       |
      | Телефон          | да                     |
      | Газ в доме       | да                     |
      | Интернет         | да                     |
      | Лифты в здании   | да                     |
      | Мусоропровод     | да                     |
       * при создании премиума я указываю владельца пользователя с ролью "Доверенный интернет-партнер"
       * при создании премиума я выбираю "на 14 дней"
       * я сохраняю введенный примиум
      То на БО показано диалоговое окно "Запись добавлена"

   Когда я закрываю диалоговое окно
       * открыта страница для региона "Россия"
       * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я перехожу в список моих объявлений
       * в ЛК ИП я выбираю пакет "NEW [TEST] Недвижимость"
       * в ЛК ИП я выбираю регион "Все регионы"
       * открыт список объявлений пользователя
      То объявление с названием "Тест создания премиума" присутствует в списке
       * у объявления указан город "Москва"
       * у объявления указана цена "100500" в долларах

    Когда я открываю детали этого объявления
      То на вкладке "Все" "Серия здания" равно "КОПЭ"
       * на вкладке "Все" "Материал стен" равно "панельный"
       * на вкладке "Все" "Высота потолков" равно "4 м"
       * на вкладке "Все" "Система водоснабжения" равно "центральная"
       * на вкладке "Все" "Система отопления" равно "центральная"
       * на вкладке "Все" присутствует "Газ в доме"
       * на вкладке "Все" присутствует "Лифты в здании"
       * на вкладке "Все" присутствует "Мусоропровод"
       * на вкладке "Все" "Жилая площадь" равно "150 кв. м"
       * на вкладке "Все" "Площадь кухни" равно "25 кв. м"
       * на вкладке "Все" "Ремонт" равно "евроремонт"
       * на вкладке "Все" "Санузел" равно "раздельный"
       * на вкладке "Все" присутствует "Телефон"
       * на вкладке "Все" присутствует "Интернет"
       * на вкладке "Все" присутствует "Балкон/Лоджия"
       * на вкладке "Все" присутствует "Приватизированная квартира"
       * на вкладке "Все" "Комнат в квартире" равно "4"
       * на вкладке "Все" "Общая площадь" равно "200 кв. м"
       * на вкладке "Все" "Этаж" равно "10"
       * на вкладке "Все" "Этажей в здании" равно "10"
       * адрес в объявлении равен "Москва, Интернациональная, 10"
   Когда на странице объявления я открываю вкладку "На карте"
      То на странице объявления открыта карта

#@after_index
  Сценарий: Проверка создания премиума
   Когда на главной странице я перехожу в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок"
       * на странице поиска загружен список результатов
       * в списке премиумов присутствует объявление "Тест создания премиума"


#@new_advert
  Сценарий: Смена статуса на премиум
   Когда я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок" с параметрами:
      | parameter                  | value                |
      | Улица                      | Интернациональная    |
      | Дом                        | 10                   |
      | Ближайшее метро            | Белорусская м.       |
      | До метро                   | 5                    |
      | Приватизированная квартира | x                    |
      | Комнат в квартире:         | 4                    |
      | Общая площадь:             | 400                  |
      | Этаж:                      | 4                    |
      | Этажей в здании:           | 8                    |
      | Цена:                      | 400000               |
      | Валюта                     | $                    |
      | Текст                      | Тест смена статуса на премиум|
     * я перехожу на шаг 3
     * открыт список объявлений пользователя
     * в ЛК ИП я выбираю пакет "NEW [TEST] Недвижимость"
     * объявление с названием "4-комн.  квартира,   Интернациональная ул,   10,  4/8,  площадь:  общая 400 кв. м.,  приватизированная" присутствует в списке
     * в ЛК ИП я запоминаю значение поля "Премиум"
     * я делаю данное объявление премиумом
    То в ЛК ИП значение поля "Премиум" уменьшилось на единицу
 Когда я открываю детали этого объявления
     * на странице объявления я открываю вкладку "На карте"
    То на странице объявления открыта карта

#@after_index
  Сценарий: Проверка  смена статуса на премиум
   Когда на главной странице я перехожу в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок"
       * на странице поиска загружен список результатов
       * в списке премиумов присутствует объявление "4-комн.  квартира,   Интернациональная ул,   10,  4/8,  площадь:  общая 400 кв. м.,  приватизированная"

#@new_advert
  Сценарий: Подача объявления с фотографией
   Когда я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок" с параметрами:
      | parameter                  | value                          |
      | Улица                      | Интернациональная              |
      | Дом                        | 10                             |
      | Ближайшее метро            | Белорусская м.                 |
      | До метро                   | 5                              |
      | Приватизированная квартира | x                              |
      | Комнат в квартире:         | 5                              |
      | Общая площадь:             | 500                            |
      | Этаж:                      | 5                              |
      | Цена:                      | 500000                         |
      | Валюта                     | $                              |
      | Текст                      | Тест подачи объявления с фото  |
       * я загружаю фото на шаге 2
       * я перехожу на шаг 3
       * открыт список объявлений пользователя
      То объявление с названием "5-комн.  квартира,   Интернациональная ул,   10,  5,  площадь:  общая 500 кв. м.,  приватизированная" присутствует в списке
       * у объявления указан город "Москва"
       * у объявления указана цена "500000" в долларах
   Когда я открываю детали этого объявления
      То у объявления отображается загруженная фотография
   Когда на странице объявления я открываю вкладку "На карте"
      То на странице объявления открыта карта

#@after_index
  Сценарий: Проверка подачи объявления с фото
   Когда на главной странице я перехожу в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок"
       * на странице поиска загружен список результатов
       * в списке обычных объявлений присутствует объявление "5-комн.  квартира,   Интернациональная ул,   10,  5/8,  площадь:  общая 500 кв. м.,  приватизированная"
       * у объявления "5-комн.  квартира,   Интернациональная ул,   10,  5,  площадь:  общая 500 кв. м.,  приватизированная" отображается загруженная фотография

#@new_advert
  Сценарий: Подача объявления с видео
   Когда я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок" с параметрами:
      | parameter                  | value                          |
      | Улица                      | Интернациональная              |
      | Дом                        | 10                             |
      | Ближайшее метро            | Белорусская м.                 |
      | До метро                   | 5                              |
      | Приватизированная квартира | x                              |
      | Комнат в квартире:         | 6                              |
      | Этажей в здании:           | 6                              |
      | Общая площадь:             | 600                            |
      | Этаж:                      | 6                              |
      | Цена:                      | 600000                         |
      | Валюта                     | $                              |
      | Текст                      | Тест подачи объявления с фото  |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
       * открыт список объявлений пользователя
      То объявление с названием "6-комн.  квартира,   Интернациональная ул,   10,  6/6,  площадь:  общая 600 кв. м.,  приватизированная" присутствует в списке
       * у объявления указан город "Москва"
       * у объявления указана цена "600000" в долларах
       * в деталях объявления отображается загруженное видео
   Когда на странице объявления я открываю вкладку "На карте"
      То на странице объявления открыта карта

#@after_index
  Сценарий: Проверка подачи объявления с видео
   Когда на главной странице я перехожу в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок"
       * на странице поиска загружен список результатов
       * в списке обычных объявлений присутствует объявление "6-комн.  квартира,   Интернациональная ул,   10,  6/6,  площадь:  общая 600 кв. м.,  приватизированная"

#@new_advert
  Сценарий: Поднятие объявления
   Когда я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок" с параметрами:
      | parameter                  | value                    |
      | Улица                      | Интернациональная        |
      | Дом                        | 10                       |
      | Ближайшее метро            | Белорусская м.           |
      | До метро                   | 5                        |
      | Приватизированная квартира | x                        |
      | Комнат в квартире:         | 7                        |
      | Общая площадь:             | 700                      |
      | Этаж:                      | 7                        |
      | Цена:                      | 700000                   |
      | Валюта                     | $                        |
      | Текст                      | Тест поднятия объявления |
     * я перехожу на шаг 3
     * открыт список объявлений пользователя
     * в ЛК ИП я выбираю пакет "NEW [TEST] Недвижимость"
     * объявление с названием "7-комн.  квартира,   Интернациональная ул,   10,  7,  площадь:  общая 700 кв. м.,  приватизированная" присутствует в списке
     * в ЛК ИП я запоминаю значение поля "Поднятие"
     * я поднимаю данное объявление
    То в ЛК ИП значение поля "Поднятие" уменьшилось на единицу
 Когда я открываю детали этого объявления
     * на странице объявления я открываю вкладку "На карте"
    То на странице объявления открыта карта

#@after_index
  Сценарий: Проверка поднятия
   Когда на главной странице я перехожу в категорию "Недвижимость -> Квартиры. Продажа -> Вторичный рынок"
       * на странице поиска загружен список результатов
       * в списке обычных объявлений присутствует объявление "7-комн.  квартира,   Интернациональная ул,   10,  7,  площадь:  общая 700 кв. м.,  приватизированная"
       * первым в списке обычных объявлений первым идёт объявление "7-комн.  квартира,   Интернациональная ул,   10,  7,  площадь:  общая 700 кв. м.,  приватизированная"
