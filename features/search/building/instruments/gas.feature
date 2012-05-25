# language:ru
# encoding: utf-8
Функционал: Строительство и ремонт -> Инструменты -> Бензоинструмент

  Контекст:
    Когда открыта страница для региона "Россия"
        И на главной странице я перехожу в категорию "Строительство и ремонт -> Инструменты -> Бензоинструмент"

  Сценарий: Все результаты
   Когда я делаю поиск по следующим параметрам:
       | parameter      | min  | max    | value |
       И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И сначала отображаются премиум-объявления
       И на странице показано <= 20 объявлений

  Сценарий: Фильтр по типу предложения
   Когда я делаю поиск по следующим параметрам:
      | parameter       | value  |
      | Тип предложения | продам |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Тип предложения" равно "продам"

  Сценарий: Фильтр по состояние
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
      | Марка     | Bosch |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Марка" равно "Bosch"

# Тип инструмента не отображается в деталях объявления
#  Сценарий: Фильтр по типу инструмента
#   Когда я делаю поиск по следующим параметрам:
#      | parameter       | value    |
#      | Тип инструмента | дисковая |
#      И на странице поиска загружен список результатов

#      То на странице показано >= 1 объявлений
#       И в деталях первого объявления "Тип" равно "дисковая"

@bugs @bug34787
  Сценарий: Фильтр по мощности
   Когда я делаю поиск по следующим параметрам:
      | parameter    | min  | max  |
      | Мощность, Вт | 1000 | 2000 |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Мощность, Вт" >= "1000"
       И в деталях первого объявления "Мощность, Вт" <= "2000"

  Сценарий: Фильтр по объему двигателя
   Когда я делаю поиск по следующим параметрам:
      | parameter               | min | max |
      | Объем двигателя, куб.см | 1   | 100 |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Объем двигателя, куб.см" >= "1"
       И в деталях первого объявления "Объем двигателя, куб.см" <= "100"

  Сценарий: Фильтр по весу
   Когда я делаю поиск по следующим параметрам:
      | parameter | min | max |
      | Вес, кг   | 1   | 100 |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Вес, кг" >= "1"
       И в деталях первого объявления "Вес, кг" <= "100"

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

@bugs @bug34183
  Сценарий: Фильтр по ключевому слову
    Когда я ищу "память"
        И на странице поиска загружен список результатов

       То на странице показано >= 1 объявлений
        И в первом объявлении содержится "память"
