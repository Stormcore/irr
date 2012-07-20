# language:ru
# encoding: utf-8
Функционал: Авто и мото -> Коммерческий транспорт -> Грузовые прицепы

  Контекст:
    Когда открыта страница для региона "Россия"
        И на главной странице я перехожу в категорию "Авто и мото -> Коммерческий транспорт -> Грузовые прицепы"

@all_results
  Сценарий: Все результаты
   Когда на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И сначала отображаются премиум-объявления
       И на странице показано <= 20 объявлений

  Сценарий: Фильтр по цене
    Когда я делаю поиск по следующим параметрам:
        | parameter      | min  | max    | value |
        | Цена           | 100  | 100000 |       |
        | Валюта         |      |        | руб.  |
       И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении цена >= 100
       И в каждом объявлении цена <= 100000
       И в каждом объявлении валюта равна "руб."

  Сценарий: Фильтр по валюте
    Когда я делаю поиск по следующим параметрам:
      | parameter      | min  | max    | value |
      | Цена           | 100  | 100000 |       |
      | Валюта         |      |        | $     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении валюта равна "$"
       И в каждом объявлении цена >= 100
       И в каждом объявлении цена <= 100000

  Сценарий: Фильтр по "Новый или подержанный"
    Когда я делаю поиск по следующим параметрам:
      | parameter             | value |
      | Новый или подержанный | новый |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Новый или подержанный" равно "новый"

@customfield
  Сценарий: Фильтр по году выпуска
    Когда я делаю поиск по следующим параметрам:
      | parameter      | min  | max  |
      | Год выпуска    | 1933 | 2012 |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Год выпуска" в границах "1933 - 2012"

@customfield
  Сценарий: Фильтр по году выпуска
    Когда я делаю поиск по следующим параметрам:
      | parameter      | max     |
      | Год выпуска    | 1000000 |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений

@customfield
  Сценарий: Фильтр по типу кузова
    Когда я делаю поиск по следующим параметрам:
      | parameter   | value  |
      | Тип прицепа | Фургон |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Тип прицепа" равно "Фургон"

@customfield
  Сценарий: Фильтр по марке и модели
    Когда я делаю поиск по следующим параметрам:
      | parameter | value   |
      | Марка     | Schmitz |
      | Модель    | SKO     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Марка" равно "Schmitz"
       И в деталях первого объявления "Модель" равно "SKO"

@customfield
@empty_results
  Сценарий: Фильтр по числу осей
    Когда я делаю поиск по следующим параметрам:
      | parameter  | value |
      | Число осей | 3     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Число осей" равно "3"

@customfield
  Сценарий: Фильтр по пробегу
   Когда я делаю поиск по следующим параметрам:
      | parameter | max     |
      | Пробег    | 1000000 |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений

# Отсутсвуют картинки в http://irr.ru/advert/160176782/
# и http://irr.ru/advert/176161042/
@bugs @bug_missing_photo
  Сценарий: Фильтр по наличию фото
    Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | С фото    | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении отображается загруженная фотография

@empty_results
  Сценарий: Фильтр по наличию видео
    Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | С видео   | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления отображается видео

  Сценарий: Фильтр по источнику
   Когда я делаю поиск по следующим параметрам:
      | parameter | value             |
      | Источник  | Интернет-партнёры |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении источник равен "Интернет-партнёры"

@empty_results
  Сценарий: Фильтр по времени подачи
    Когда я делаю поиск по следующим параметрам:
      | parameter | value    |
      | Поданные  | за месяц |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И каждое объявление подано не более 31 дней назад

@bugs @bug34183
  Сценарий: Фильтр по ключевому слову в заголовке объявления
    Когда я указываю искать только в заголовках объявления
        И я ищу "полуприцеп"
        И на странице поиска загружен список результатов

       То на странице показано >= 1 объявлений
        И в заголовке каждого объявления содержится "полуприцеп"

  Сценарий: Фильтр по ключевому слову
    Когда я ищу "фургон"
        И на странице поиска загружен список результатов

       То на странице показано >= 1 объявлений
        И в первом объявлении содержится "фургон"
