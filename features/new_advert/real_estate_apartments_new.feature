# language:ru
# encoding: utf-8
Функционал: Недвижимость -> Квартиры. Продажа -> Новостройки - подача объявления

  Контекст:
    Когда открыта страница для региона "Россия"

@new_advert
  Сценарий: Подача объявления неавторизированным пользователем
   Когда я выхожу из текущего пользователя
       * я перехожу к подаче объявления
       * я ввожу логин и пароль роли "Доверенный интернет-партнер"
       * я подаю объявление в категорию "Недвижимость -> Квартиры. Продажа -> Новостройки"
       * я ввожу следующие данные на шаге 2:
      | parameter          | value                                        |
      | Регион             | Иркутская обл Усть-Ордынский Бурятский округ |
      | Населённый пункт   | Усть-Алтан                                   |
      | Возможна ипотека   | x                                            |
      | Комнат в квартире: | 2                                            |
      | Общая площадь:     | 80                                           |
      | Этаж:              | 4                                            |
      | Этажей в здании:   | 8                                            |
      | Цена:              | 100000                                       |
      | Валюта             | $                                            |
      | Текст              | Тест подачи объявления неавторизированным пользователем |

       * я ввожу следующие данные на шаге 2 в секции "Подробнее о здании":
      | parameter             | value       |
      | Год постройки/сдачи:  | 2003        |
      | Серия здания          | КОПЭ        |
      | Материал стен         | кирпичный   |
      | Высота потолков:      | 3           |
      | Система водоснабжения | центральная |
      | Система отопления     | центральная |
      | Газ в доме            | x           |
      | Лифты в здании        | x           |
      | Мусоропровод          | x           |
      | Охрана здания         | x           |

       * я ввожу следующие данные на шаге 2 в секции "Подробнее о квартире":
      | parameter             | value       |
      | Жилая площадь:        | 50          |
      | Площадь кухни:        | 20          |
      | Отделка               | с отделкой  |
      | Санузел               | раздельный  |
      | Телефон               | x           |
      | Интернет              | x           |
      | Балкон/Лоджия         | x           |
       * я перехожу на шаг 3
       * открыт список объявлений пользователя

      То объявление с названием "2-комн. кв.,  Осинский р-н,  Усть-Алтан с,  4/8,  площадь:  общая 80 кв. м.,  жилая 50 кв. м.,  кухня 20 кв. м.,  с/у раздельный,  с отделкой,  балкон/лоджия" присутствует в списке
       * у объявления указан регион "Иркутская обл Усть-Ордынский Бурятский"
       * у объявления указан город "Усть-Алтан"
       * у объявления указана цена "100000" в долларах

   Когда я открываю детали этого объявления 
      То на вкладке "Все" "Год постройки/сдачи" равно "2003 г."
       * на вкладке "Все" "Серия здания" равно "КОПЭ"
       * на вкладке "Все" "Материал стен" равно "кирпичный"
       * на вкладке "Все" "Высота потолков" равно "3 м"
       * на вкладке "Все" "Система водоснабжения" равно "центральная"
       * на вкладке "Все" "Система отопления" равно "центральная"
       * на вкладке "Все" присутствует "Газ в доме"
       * на вкладке "Все" присутствует "Лифты в здании"
       * на вкладке "Все" присутствует "Мусоропровод"
       * на вкладке "Все" присутствует "Охрана здания"
       * на вкладке "Все" "Жилая площадь" равно "50 кв. м"
       * на вкладке "Все" "Площадь кухни" равно "20 кв. м"
       * на вкладке "Все" "Отделка" равно "с отделкой"
       * на вкладке "Все" "Санузел" равно "раздельный"
       * на вкладке "Все" присутствует "Интернет"
       * на вкладке "Все" присутствует "Балкон/Лоджия"
       * на вкладке "Все" присутствует "Возможна ипотека"
       * на вкладке "Все" "Комнат в квартире" равно "2"
       * на вкладке "Все" "Общая площадь" равно "80 кв. м"
       * на вкладке "Все" "Этаж" равно "4"
       * на вкладке "Все" "Этажей в здании" равно "8"