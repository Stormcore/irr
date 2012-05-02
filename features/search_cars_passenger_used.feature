# language:ru
@failing
Функционал: Авто и мото -> Легковые автомобили -> Автомобили с пробегом

  Сценарий: Все результаты
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
        | parameter      | min  | max    | value |
       И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении указан город "Москва"
       И сначала отображаются премиум-объявления
       И на странице показано <= 20 объявлений
       И в каждом объявлении отображается рисунок
       И в каждом объявлении не более 120 знаков

  Сценарий: Фильтр по цене
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
        | parameter      | min  | max    | value |
        | Цена           | 100  | 100000 |       |
        | Валюта         |      |        | руб.  |
       И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении цена >= 100
       И в каждом объявлении цена <= 100000
       И в каждом объявлении валюта равна "руб."

  Сценарий: Фильтр по валюте
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter      | min  | max    | value |
      | Цена           | 100  | 100000 |       |
      | Валюта         |      |        | $     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении валюта равна "$"
       И в каждом объявлении цена >= 100
       И в каждом объявлении цена <= 100000

  Сценарий: Фильтр по году выпуска
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter      | min  | max  |
      | Год выпуска    | 1933 | 2012 |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях каждого объявления "Год выпуска" в границах "1933 - 2012"

  Сценарий: Фильтр по марке и модели
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter | value |
      | Марка     | Audi  |
      | Модель    | A4    |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях каждого объявления "Марка" равно "Audi"
       И в деталях каждого объявления "Модель" равно "A4"

  Сценарий: Фильтр по типу кузова
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter  | value   |
      | Тип кузова | лимузин |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях каждого объявления "Тип кузова" равно "лимузин"

  Сценарий: Фильтр по типу двигателя
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter     | value  |
      | Тип двигателя | дизель |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях каждого объявления "Тип двигателя" равно "дизель"

  Сценарий: Фильтр по типу привода
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter   | value    |
      | Тип привода | передний |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях каждого объявления "Привод" равно "передний"

  Сценарий: Фильтр по типу трансмиссии
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter       | value        |
      | Тип трансмиссии | механическая |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях каждого объявления "Тип трансмиссии" равно "механическая"

@failing
  Сценарий: Фильтр по пробегу
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter | min | max   |
      | Пробег    | 10  | 20000 |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях каждого объявления "Пробег" в границах "10 - 20000"

  Сценарий: Фильтр по наличию фото
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter | value |
      | С фото    | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении отображается загруженная фотография

  Сценарий: Фильтр по наличию видео
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter | value |
      | С видео   | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях каждого объявления отображается видео

  Сценарий: Фильтр по источнику
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter | value       |
      | Источник  | Cайт IRR.RU |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении источник равен "Сайт IRR.RU"

  Сценарий: Фильтр по времени подачи
   Когда открыта страница для города "Москва"
       И на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом" 
       И я делаю поиск по следующим параметрам:
      | parameter | value           |
      | Поданные  | вчера и сегодня |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И каждое объявление подано не более 2 дней назад
