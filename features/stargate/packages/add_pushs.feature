# language:ru
# encoding: utf-8
Функционал: Добавление/удаление/редактирование пакета интернет-партнеру через БО

  Контекст:
      Когда я перехожу на БО
          * на БО я перехожу в категорию "Интернет-партнеры -> Пользователи ИП"

  Сценарий: Добавление поднятий
     Когда на БО у пользователя роли "Доверенный интернет-партнер 3" я удаляю все пакеты "NEW Здоровье и красота | ВСЕ РЕГИОНЫ"
         * на БО я добавляю интернет-партнеру пакет "NEW Здоровье и красота | ВСЕ РЕГИОНЫ" для региона "Вся Россия" со следующими параметрами:
           | поле                      | значение |
           | Поднятий (на весь период) | 100      |
         * на БО я добавляю 10 поднятий на пакет "NEW Здоровье и красота | ВСЕ РЕГИОНЫ"

      Если открыта страница для региона "Россия"
         * я вхожу под пользователем с ролью "Доверенный интернет-партнер 3"
         * я перехожу в список моих объявлений
         * в ЛК ИП я выбираю пакет "NEW Здоровье и красота | ВСЕ РЕГИОНЫ"
        То в ЛК ИП значение поля "Поднятие" равно "110"
