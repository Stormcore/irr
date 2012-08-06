# language:ru
# encoding: utf-8
Функционал: Оборудование -> Системы охраны и безопасности

  Контекст:
    Когда открыта страница для региона "Усть-Алтан"
        * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу к подаче объявления

  Сценарий: Объявление 1
   Когда я подаю объявление в категорию "Оборудование -> Системы охраны и безопасности -> Системы охраны и безопасности"
       * я ввожу следующие данные на шаге 2:
          | parameter         | value               |
          | Цена:             | 15000               |
          | Валюта            | руб.                |
          | Текст             | Продаю сигнализацию |
          | Тип предложения   | продам              |
          | Заголовок         | Продаю сигнализацию |
          | Состояние         | новый               |
          | Тип оборудования  | сигнализация        |
       * я загружаю фото на шаге 2
       * я перехожу на шаг 3
      То открыт список объявлений пользователя
       * объявление с названием "Продаю сигнализацию" присутствует в списке
       * у объявления указан регион "Иркутская обл Усть-Ордынский Бурятский"
       * у объявления указан город "Усть-Алтан"
       * у объявления указана цена "15000" в рублях

    Когда я открываю детали этого объявления
       То на вкладке "Все" указаны следующие параметры:
          | поле             | значение     |
          | Тип предложения  | продам       |
          | Состояние        | новый        |
          | Тип оборудования | сигнализация |

  Сценарий: Объявление 2
   Когда я подаю объявление в категорию "Оборудование -> Системы охраны и безопасности -> Оборудование для видеонаблюдения"
       * я ввожу следующие данные на шаге 2:
          | parameter         | value          |
          | Марка             | Panasonic      |
          | Модель            | A01            |
          | Цена:             | 1000           |
          | Валюта            | $              |
          | Тип предложения   | продам         |
          | Заголовок         | Продаю монитор |
          | Состояние         | новый          |
          | Вид               | мониторы       |
          | Текст             | Продаю монитор для видеонаблюдения |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
      То открыт список объявлений пользователя
       * объявление с названием "Продаю монитор" присутствует в списке
       * у объявления указан регион "Иркутская обл Усть-Ордынский Бурятский"
       * у объявления указан город "Усть-Алтан"
       * у объявления указана цена "1000" в долларах

    Когда я открываю детали этого объявления
       То на вкладке "Все" указаны следующие параметры:
          | поле            | значение  |
          | Тип предложения | продам    |
          | Состояние       | новый     |
          | Вид             | мониторы  |
          | Марка           | Panasonic |
          | Модель          | A01       |

  Сценарий: Объявление 3
   Когда я подаю объявление в категорию "Оборудование -> Системы охраны и безопасности -> Оборудование для охранной сигнализации"
       * я ввожу следующие данные на шаге 2:
          | parameter         | value                        |
          | Марка             | Intelligent                  |
          | Модель            | XYZ                          |
          | Цена:             | 1000                         |
          | Валюта            | $                            |
          | Тип предложения   | продам                       |
          | Заголовок         | Продаю пожарную сигнализацию |
          | Состояние         | новый                        |
          | Вид               | пожарная сигнализация        |
          | Текст             | Продаю пожарную сигнализацию |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
      То открыт список объявлений пользователя
       * объявление с названием "Продаю пожарную сигнализацию" присутствует в списке
       * у объявления указан регион "Иркутская обл Усть-Ордынский Бурятский"
       * у объявления указан город "Усть-Алтан"
       * у объявления указана цена "1000" в долларах

    Когда я открываю детали этого объявления
       То на вкладке "Все" указаны следующие параметры:
          | поле            | значение              |
          | Тип предложения | продам                |
          | Состояние       | новый                 |
          | Вид             | пожарная сигнализация |
          | Марка           | Intelligent           |
          | Модель          | XYZ                   |

  Сценарий: Объявление 4
   Когда я подаю объявление в категорию "Оборудование -> Системы охраны и безопасности -> Сейфы"
       * я ввожу следующие данные на шаге 2:
          | parameter             | value        |
          | Марка                 | Comsafe      |
          | Модель                | AB1          |
          | Глубина, см:          | 1000         |
          | Ширина, см:           | 1000         |
          | Длина, см:            | 1000         |
          | Цена:                 | 1000         |
          | Валюта                | $            |
          | Текст                 | Продаю сейф  |
          | Тип предложения       | продам       |
          | Заголовок             | Продаю сейф  |
          | Состояние             | новый        |
          | Вид сейфа             | встраиваемые |
          | Класс взломостойкости | 3            |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
      То открыт список объявлений пользователя
       * объявление с названием "Продаю сейф" присутствует в списке
       * у объявления указан регион "Иркутская обл Усть-Ордынский Бурятский"
       * у объявления указан город "Усть-Алтан"
       * у объявления указана цена "1000" в долларах

    Когда я открываю детали этого объявления
       То на вкладке "Все" указаны следующие параметры:
          | поле                  | значение     |
          | Марка                 | Comsafe      |
          | Модель                | AB1          |
          | Глубина, см:          | 1000         |
          | Ширина, см:           | 1000         |
          | Длина, см:            | 1000         |
          | Тип предложения       | продам       |
          | Состояние             | новый        |
          | Вид сейфа             | встраиваемые |
          | Класс взломостойкости | 3            |

  Сценарий: Объявление 5
   Когда я подаю объявление в категорию "Оборудование -> Системы охраны и безопасности -> Контроль доступа"
       * я ввожу следующие данные на шаге 2:
          | parameter       | value                    |
          | Марка           | Commax                   |
          | Модель          | XYZ                      |
          | Цена:           | 15000                    |
          | Валюта          | руб.                     |
          | Текст           | Продаю систему доступа   |
          | Тип предложения | продам                   |
          | Заголовок       | Продаю систему доступа   |
          | Состояние       | новый                    |
          | Вид             | системы контроля доступа |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
      То открыт список объявлений пользователя
       * объявление с названием "Продаю систему доступа" присутствует в списке
       * у объявления указан регион "Иркутская обл Усть-Ордынский Бурятский"
       * у объявления указан город "Усть-Алтан"
       * у объявления указана цена "15000" в рублях

    Когда я открываю детали этого объявления
       То на вкладке "Все" указаны следующие параметры:
          | поле            | значение                 |
          | Марка           | Commax                   |
          | Модель          | XYZ                      |
          | Тип предложения | продам                   |
          | Состояние       | новый                    |
          | Вид             | системы контроля доступа |
