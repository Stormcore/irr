# language:ru
# encoding: utf-8
Функционал: Компьютерная техника -> Планшеты

  Контекст:
    Когда открыта страница для города "Москва"
        И на главной странице я перехожу в категорию "Компьютерная техника -> Планшеты"

  Сценарий: Все результаты
   Когда я делаю поиск по следующим параметрам:
        | parameter      | min  | max    | value |
       И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении указан город "Москва"
       И сначала отображаются премиум-объявления
       И на странице показано <= 20 объявлений
       И в каждом объявлении отображается рисунок
       И в каждом объявлении не более 130 знаков

  Сценарий: Фильтр по типу предложения
   Когда я делаю поиск по следующим параметрам:
      | parameter       | value  |
      | Тип предложения | продам |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Тип предложения" равно "продам"

  Сценарий: Фильтр по состоянию
   Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | Состояние | новый |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Состояние" равно "новый"

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

  Сценарий: Фильтр по марке
    Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | Марка     | Apple |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Марка" равно "Apple"

  Сценарий: Фильтр по модели
    Когда я делаю поиск по следующим параметрам:
      | parameter | value             |
      | Модель    | iPad 2 64Gb Wi-Fi |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Модель" равно "iPad 2 64Gb Wi-Fi"

  Сценарий: Фильтр по диагонали экрана
    Когда я делаю поиск по следующим параметрам:
      | parameter               | min | max |
      | Диагональ экрана, дюймы | 7   | 10  |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Диагональ экрана, дюймы" >= "7"
       И в деталях первого объявления "Диагональ экрана, дюймы" =< "10"

  Сценарий: Фильтр по объему встроенной памяти
    Когда я делаю поиск по следующим параметрам:
      | parameter                   | min | max |
      | Объем встроенной памяти, Гб | 1   | 32  |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Объем встроенной памяти, Гб" >= "1"
       И в деталях первого объявления "Объем встроенной памяти, Гб" =< "32"

  Сценарий: Фильтр по наличию мультитача
    Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | Мультитач | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления присутствует "Мультитач"

  Сценарий: Фильтр по наличию Bluetooth
    Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | Bluetooth | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления присутствует "Bluetooth"

  Сценарий: Фильтр по наличию 3G
    Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | 3G        | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления присутствует "3G"

  Сценарий: Фильтр по операционной системе
    Когда я делаю поиск по следующим параметрам:
      | parameter            | value   |
      | Операционная система | Android |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Операционная система" равно "Android"

  Сценарий: Фильтр по весу
    Когда я делаю поиск по следующим параметрам:
      | parameter | min | max |
      | Вес       | 1   | 32  |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Вес" >= "1"
       И в деталях первого объявления "Вес" =< "32"

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

@empty_results
  Сценарий: Фильтр по источнику
    Когда я делаю поиск по следующим параметрам:
      | parameter | value       |
      | Источник  | Cайт IRR.RU |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении источник равен "Сайт IRR.RU"

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
        И я ищу "память"
        И на странице поиска загружен список результатов

       То на странице показано >= 1 объявлений
        И в заголовке каждого объявления содержится "память"

  Сценарий: Фильтр по ключевому слову
    Когда я ищу "память"
        И на странице поиска загружен список результатов

       То на странице показано >= 1 объявлений
        И в первом объявлении содержится "память"
