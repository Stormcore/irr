# language:ru
# encoding: utf-8
Функционал: Компьютерная техника -> Комплектующие -> Блоки питания
Блоки питания - заполнение

  Контекст:
    Когда открыта страница для региона "Россия"

  Сценарий: Компьютерная техника -> Комплектующие -> Блоки питания
Блоки питания
      Когда на главной странице я перехожу в категорию "Компьютерная техника -> Комплектующие -> Блоки питания
Блоки питания"
        * на странице категории присутствует секция "Производители"
        * я заполняю ссылки в секции "Производители" с параметрами:
        | название | значение                                |
        | feature  | Компьютерная техника -> Комплектующие -> Блоки питания
Блоки питания |
        | category | Компьютерная техника -> Комплектующие -> Блоки питания
Блоки питания |
        | section  | Производители                           |
        | field    | Марка                                   |
