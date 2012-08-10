# language:ru
# encoding: utf-8
Функционал: ОП - Поднятие - Авто и Мото -> Легковые автомобили -> Автомобили с пробегом

@advert_submit
  Сценарий: Подача объявления для ОП через БО
    Когда я перехожу на БО
        * на БО я перехожу в категорию "Объявления -> Каталог объявлений"
        * на странице дерева объявлений в БО я выбираю категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом -> авто с пробегом"
        * я созданию новое объявление в БО
        * при создании объявления я ввожу следующие данные:
          | parameter            | value          |
          | Заголовок            | Продаю Ауди A2 |
          | Регион               | Усть-Алтан     |
          | Марка                | Audi           |
          | Модель               | A2             |
          | Цена                 | 20000          |
          | Валюта               | $              |
          | Год выпуска          | 1992           |
          | Тип кузова           | кабриолет      |
          | Тип трансмиссии      | автоматическая |
          | Текст объявления     | Продаю ауди    |

        * при создании объявления я указываю владельца пользователя с ролью "Обычный пользователь"
        * я сохраняю введенное объявление

     Когда открыта страница для региона "Усть-Алтан"
        * я вхожу под пользователем с ролью "Обычный пользователь"
        * я перехожу в список моих объявлений
        * объявление с названием "Продаю Ауди A2" присутствует в списке
        * я размещаю данное объявление
        * я делаю данное объявление премиумом
    Когда на странице оплаты я выбираю SMS
        * я перехожу на БО
        * я отсылаю SMS для оплаты
        * открыта страница для региона "Усть-Алтан"
        * я вхожу под пользователем с ролью "Обычный пользователь"
        * я перехожу в список моих объявлений
       То объявление с названием "Продаю Ауди A2" присутствует в списке
