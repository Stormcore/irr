# language:ru
# encoding: utf-8
Функционал: Импорт в категорию Авто и мото -> Легковые автомобили -> Новые автомобили

  Сценарий: Импорт объявления ОП
    Когда я обновляю и импортирую файл "cars_passanger_new/scenario1.xml" для роли "Пользователь для импорта"

    Когда открыта страница для региона "Москва"
        * я вхожу под пользователем с ролью "Пользователь для импорта"
        * я перехожу в список моих объявлений
       То в ЛК ОП объявление с названием "Продаю Ауди A1" присутствует в списке
        * у объявления указан город "Москва"
        * у объявления указана цена "1000" в долларах

    Когда я открываю детали этого объявления
        * на вкладке "Все" "Марка" равно "Audi"
        * на вкладке "Все" "Модель" равно "A1"
        * на вкладке "Все" "Год выпуска" равно "2001 г."
        * на вкладке "Все" "Тип кузова" равно "купе"
        * на вкладке "Все" "Тип трансмиссии" равно "механическая"

  Сценарий: Импорт объявления ИП
    Когда я обновляю и импортирую файл "cars_passanger_new/scenario2.xml" для роли "Доверенный интернет-партнер"

    Когда открыта страница для региона "Москва"
        * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу в список моих объявлений
       То в ЛК ИП объявление с названием "Продаю Ауди A1" присутствует в списке
        * у объявления указан город "Москва"
        * у объявления указана цена "1000" в долларах

    Когда я открываю детали этого объявления
        * на вкладке "Все" "Марка" равно "Audi"
        * на вкладке "Все" "Модель" равно "A1"
        * на вкладке "Все" "Год выпуска" равно "2001 г."
        * на вкладке "Все" "Тип кузова" равно "купе"
        * на вкладке "Все" "Тип трансмиссии" равно "механическая"

  Сценарий: Импорт объявления с фото
    Когда я обновляю и импортирую файл "cars_passanger_new/scenario3.xml" для роли "Доверенный интернет-партнер"

    Когда открыта страница для региона "Москва"
        * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу в список моих объявлений
       То в ЛК ИП объявление с названием "Продаю Ауди A1" присутствует в списке
        * у объявления отображается загруженная фотография
