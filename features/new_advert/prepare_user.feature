# language:ru
# encoding: utf-8
Функционал: Подготовка пользователя к подаче объявлений

  Сценарий: Удаление всех объявлений
    Когда открыта страница для региона "Россия"
        * я вхожу под пользователем с ролью "Доверенный интернет-партнер"
        * я перехожу в список моих объявлений
       То я удаляю все объявления ИП

  Сценарий: Добавление пакета для недвижимости
    Когда я перехожу на БО
        * на БО я перехожу в категорию "Интернет-партнеры -> Пользователи ИП"
        * на БО я удаляю все пакеты "NEW [TEST] Недвижимость" у пользователя роли "Доверенный интернет-партнер"
        * на БО я добавляю интернет-партнеру пакет "NEW [TEST] Недвижимость" для региона "Вся Россия"

  Сценарий: Добавление пакета для авто
    Когда я перехожу на БО
        * на БО я перехожу в категорию "Интернет-партнеры -> Пользователи ИП"
        * на БО я удаляю все пакеты "NEW Авто | ВСЕ РЕГИОНЫ" у пользователя роли "Доверенный интернет-партнер"
        * на БО я добавляю интернет-партнеру пакет "NEW Авто | ВСЕ РЕГИОНЫ" для региона "Вся Россия"