# language:ru
# encoding: utf-8
Функционал: Мебель, интерьер, обиход -> Предметы обихода -> Матрасы

  Контекст:
    Когда открыта страница для региона "Россия"
        И на главной странице я перехожу в категорию "Мебель, интерьер, обиход -> Предметы обихода -> Матрасы"

@all_results
  Сценарий: Все результаты
   Когда на странице поиска загружен список результатов

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

  Сценарий: Фильтр по состоянию
   Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | Состояние | новый |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Состояние" равно "новый"

  Сценарий: Фильтр по цене
    Когда я делаю поиск по следующим параметрам:
        | parameter      | min   | max     | value |
        | Цена           | 10000 | 1000000 |       |
        | Валюта         |       |         | руб.  |
       И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении цена >= 10000
       И в каждом объявлении цена <= 1000000
       И в каждом объявлении валюта равна "руб."

  Сценарий: Фильтр по валюте
    Когда я делаю поиск по следующим параметрам:
      | parameter      | min  | max    | value |
      | Цена           | 1000 | 100000 |       |
      | Валюта         |      |        | $     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении валюта равна "$"
       И в каждом объявлении цена >= 1000
       И в каждом объявлении цена <= 100000

  Сценарий: Фильтр по марке
   Когда я делаю поиск по следующим параметрам:
      | parameter | value   |
      | Марка     | Орматек |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Марка" равно "Орматек"

  Сценарий: Фильтр по назначению
   Когда я делаю поиск по следующим параметрам:
      | parameter  | value        |
      | Назначение | классический |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Назначение" равно "классический"

  Сценарий: Фильтр по виду
   Когда я делаю поиск по следующим параметрам:
      | parameter | value       |
      | Вид       | двуспальный |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Вид" равно "двуспальный"

  Сценарий: Фильтр по жесткости
   Когда я делаю поиск по следующим параметрам:
      | parameter | value   |
      | Жесткость | средняя |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Жесткость" равно "средняя"

  Сценарий: Фильтр по основе
   Когда я делаю поиск по следующим параметрам:
      | parameter | value        |
      | Основа    | беспружинный |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Основа" равно "беспружинный"

  Сценарий: Фильтр по наполнителю
   Когда я делаю поиск по следующим параметрам:
      | parameter   | value  |
      | Наполнитель | войлок |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Наполнитель" равно "войлок"

  Сценарий: Фильтр по ширине
   Когда я делаю поиск по следующим параметрам:
      | parameter  | min | max |
      | Ширина, см | 10  | 300 |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Ширина, см" >= "10"
       И в деталях первого объявления "Ширина, см" <= "300"

  Сценарий: Фильтр по высоте
   Когда я делаю поиск по следующим параметрам:
      | parameter  | min | max |
      | Высота, см | 10  | 300 |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Высота, см" >= "10"
       И в деталях первого объявления "Высота, см" <= "300"

  Сценарий: Фильтр по длине
   Когда я делаю поиск по следующим параметрам:
      | parameter | min | max |
      | Длина, см | 10  | 300 |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Длина, см" >= "10"
       И в деталях первого объявления "Длина, см" <= "300"


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
