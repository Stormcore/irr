# language:ru
# encoding: utf-8
Функционал: Электроника и техника -> Кухонная техника -> Плиты и варочные панели - заполнение

  Контекст:
    Когда открыта страница для региона "Россия"

  Сценарий: Электроника и техника -> Кухонная техника -> Плиты и варочные панели
      Когда на главной странице я перехожу в категорию "Электроника и техника -> Кухонная техника -> Плиты и варочные панели"
        * на странице категории присутствует секция "Тип плиты"
        * я заполняю ссылки в секции "Тип плиты" с параметрами:
        | название | значение                                                             |
        | feature  | Электроника и техника -> Кухонная техника -> Плиты и варочные панели (тип техники) |
        | category | Электроника и техника -> Кухонная техника -> Плиты и варочные панели |
        | section  | Тип плиты                                                            |
        | field    | Тип плиты                                                            |
