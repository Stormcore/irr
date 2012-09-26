# language:ru
# encoding: utf-8
Функционал: Недвижимость -> Квартиры. аренда

  Сценарий: Объявление 1 - Москва
   Когда открыта страница для города "Москва"
       * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Недвижимость -> Квартиры. аренда" с параметрами:
          | parameter          | value            |
          | Улица              | Черепковская 3-я |
          | Дом                | 15Астр1          |
          | Ближайшее метро    | Новогиреево м.   |
          | До метро           | 3                |
          | Комнат в квартире  | 4                |
          | Общая площадь      | 400              |
          | Этаж               | 4                |
          | Цена               | 400              |
          | Валюта             | $                |
          | Срок сдачи         | сутки            |
          | Текст              | Продаю, четвертый этаж|

       * я ввожу следующие данные на шаге 2 в секции "Подробнее о квартире":
          | parameter       | value      |
          | Жилая площадь   | 200        |
          | Площадь кухни   | 200        |
          | Ремонт          | евроремонт |
          | Телефон         | x          |
          | Балкон/Лоджия   | x          |
          | Мебель          | x          |
          | Бытовая техника | x          |
          | Телефон         | x          |

       * я ввожу следующие данные на шаге 2 в секции "Подробнее о здании":
          | parameter       | value |
          | Лифты в здании  | x     |
          | Газ в доме      | x     |

       * я загружаю фото на шаге 2
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
        
      То в ЛК ИП открыт список объявлений пользователя

  Сценарий: Объявление 2 - Московская область
   Когда открыта страница для региона "Россия"
       * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Недвижимость -> Квартиры. аренда" с параметрами:
          | parameter         | value          |
          | Регион            | Московская обл |
          | Населённый пункт  | Пушкино        |
          | Улица             | Строительная   |
          | Шоссе:            | Ярославское    |
          | Удалённость       | 5              |
          | Комнат в квартире | 4              |
          | Общая площадь     | 400            |
          | Этаж              | 4              |
          | Этажей в здании   | 8              |
          | Цена               | 400000         |
          | Валюта            | $              |
          | Текст             | Продаю         |
       * я загружаю видео на шаге 2
       * я перехожу на шаг 3
        
      То в ЛК ИП открыт список объявлений пользователя

  Сценарий: Объявление 3 - Регионы
   Когда открыта страница для города "Усть-Алтан"
       * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Недвижимость -> Квартиры. аренда" с параметрами:
          | parameter          | value  |
          | Комнат в квартире  | 4      |
          | Общая площадь      | 400    |
          | Этаж               | 4      |
          | Этажей в здании    | 8      |
          | Цена               | 400000 |
          | Валюта             | €      |
          | Текст              | Продаю |
       * я загружаю фото на шаге 2
       * я перехожу на шаг 3
        
      То в ЛК ИП открыт список объявлений пользователя

  Сценарий: Объявление 4 - Москва, комнат больше 5
   Когда открыта страница для города "Москва"
       * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Недвижимость -> Квартиры. аренда" с параметрами:
          | parameter          | value               |
          | Улица              | Черепковская 3-я    |
          | Дом                | 15Астр1             |
          | Ближайшее метро    | Новогиреево м.      |
          | До метро           | 3                   |
          | Комнат в квартире  | 6                   |
          | Общая площадь      | 600                 |
          | Этаж               | 6                   |
          | Этажей в здании    | 8                   |
          | Цена               | 50000               |
          | Валюта             | руб.                |
          | Срок сдачи         | месяц               |
          | Текст              | Продаю, шестой этаж |
       * я перехожу на шаг 3
        
      То в ЛК ИП открыт список объявлений пользователя
