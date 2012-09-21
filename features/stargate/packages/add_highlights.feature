# language:ru
# encoding: utf-8
Функционал: Добавление/удаление/редактирование пакета интернет-партнеру через БО

  Контекст:
      Когда я перехожу на БО
          * на БО я перехожу в категорию "Интернет-партнеры -> Пользователи ИП"

  Сценарий: Добавление выделений
     Когда на БО я удаляю все пакеты "NEW Здоровье и красота | ВСЕ РЕГИОНЫ" у пользователя роли "Доверенный интернет-партнер 1"
         * на БО я добавляю интернет-партнеру пакет "NEW Здоровье и красота | ВСЕ РЕГИОНЫ" для региона "Вся Россия" со следующими параметрами:
           | поле                       | значение |
           | Выделений (на весь период) | 100      |
         * на БО я добавляю 10 выделений на пакет "NEW Здоровье и красота | ВСЕ РЕГИОНЫ"

      Если открыта страница для региона "Россия"
         * я вхожу под пользователем с ролью "Доверенный интернет-партнер 1"
         * я перехожу в список моих объявлений
         * в ЛК ИП я выбираю пакет "NEW Здоровье и красота | ВСЕ РЕГИОНЫ"
        То в ЛК ИП значение поля "Выделение" равно "110"
