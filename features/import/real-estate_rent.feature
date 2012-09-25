# language:ru
# encoding: utf-8
Функционал: Импорт в категорию Недвижимость -> Квартиры. Аренда

  Сценарий: Импорт объявления ОП
    Когда я обновляю и импортирую файл "real-estate_rent/scenario1.xml" для роли "Пользователь для импорта"

    Когда открыта страница для региона "Москва"
        * я вхожу под пользователем с ролью "Пользователь для импорта"
        * я перехожу в список моих объявлений
       То в ЛК ОП объявление с названием "Сдается 2х-комнатная квартира, этаж 3" присутствует в списке
        * у объявления указан город "Москва"
        * у объявления указана цена "30000" в рублях

    Когда я открываю детали этого объявления
        * на вкладке "Все" "Комнат в квартире" равно "3"
        * на вкладке "Все" "Этаж" равно "3"

  Сценарий: Импорт объявления ИП
    Когда я обновляю и импортирую файл "real-estate_rent/scenario2.xml" для роли "Доверенный интернет-партнер"

    Когда открыта страница для региона "Москва"
        * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу в список моих объявлений
       То в ЛК ИП объявление с названием "Сдается 2х-комнатная квартира, этаж 3" присутствует в списке
        * у объявления указан город "Москва"
        * у объявления указана цена "30000" в рублях

    Когда я открываю детали этого объявления
        * на вкладке "Все" "Комнат в квартире" равно "3"
        * на вкладке "Все" "Этаж" равно "3"

  Сценарий: Импорт объявления с фото
    Когда я обновляю и импортирую файл "real-estate_rent/scenario3.xml" для роли "Доверенный интернет-партнер"

    Когда открыта страница для региона "Москва"
        * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу в список моих объявлений
       То в ЛК ИП объявление с названием "Сдается 2х-комнатная квартира, этаж 3" присутствует в списке
        * у объявления отображается загруженная фотография