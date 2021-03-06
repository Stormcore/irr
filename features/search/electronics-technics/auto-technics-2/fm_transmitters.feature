# language:ru
# encoding: utf-8
Функционал: Электроника и техника -> Техника для авто -> FM-трансмиттеры

  Контекст:
    Когда открыта страница для региона "Россия"
        И на главной странице я перехожу в категорию "Электроника и техника -> Техника для авто -> FM-трансмиттеры"

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
      | parameter      | min | max | value |
      | Цена           | 10  | 50  |       |
      | Валюта         |     |     | $     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в каждом объявлении валюта равна "$"
       И в каждом объявлении цена >= 10
       И в каждом объявлении цена <= 50

@customfield
  Сценарий: Фильтр по марке
    Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | Марка     | Digma |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления "Марка" равно "Digma"

@customfield
@empty_results
  Сценарий: Фильтр по дисплею
    Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | Дисплей   | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления присутствует "Дисплей"

@customfield
 @empty_results
  Сценарий: Фильтр по пульту дистанционного управления
    Когда я делаю поиск по следующим параметрам:
      | parameter                       | value |
      | Пульт дистанционного управления | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления присутствует "Пульт дистанционного управления"

@customfield
@empty_results
  Сценарий: Фильтр по работе от прикуривателя
    Когда я делаю поиск по следующим параметрам:
      | parameter               | value |
      | Работа от прикуривателя | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления присутствует "Работа от прикуривателя"

@customfield
@empty_results
  Сценарий: Фильтр по USB-порту
    Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | USB-порт  | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления присутствует "USB-порт"

@customfield
@empty_results
  Сценарий: Фильтр по слоту для карт памяти
    Когда я делаю поиск по следующим параметрам:
      | parameter            | value |
      | Слот для карт памяти | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления присутствует "Слот для карт памяти"

@customfield
@empty_results
  Сценарий: Фильтр по MP3-проигрывателю
    Когда я делаю поиск по следующим параметрам:
      | parameter         | value |
      | MP3-проигрыватель | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления присутствует "MP3-проигрыватель"

@customfield
@empty_results
  Сценарий: Фильтр по Bluetooth
    Когда я делаю поиск по следующим параметрам:
      | parameter | value |
      | Bluetooth     | x     |
      И на странице поиска загружен список результатов

      То на странице показано >= 1 объявлений
       И в деталях первого объявления присутствует "Bluetooth"

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
        И я ищу "сабвуфер"
        И на странице поиска загружен список результатов

       То на странице показано >= 1 объявлений
        И в заголовке каждого объявления содержится "сабвуфер"

@bugs @bug34183
  Сценарий: Фильтр по ключевому слову
    Когда я ищу "сабвуфер"
        И на странице поиска загружен список результатов

       То на странице показано >= 1 объявлений
        И в первом объявлении содержится "сабвуфер"
