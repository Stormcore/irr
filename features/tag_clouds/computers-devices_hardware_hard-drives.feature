# language:ru
# encoding: utf-8
Функционал: Компьютерная техника -> Комплектующие -> Жесткие диски (HDD и SSD) - заполнение

  Контекст:
    Когда открыта страница для региона "Россия"

  Сценарий: Компьютерная техника -> Комплектующие -> Жесткие диски (HDD и SSD)
      Когда на главной странице я перехожу в категорию "Компьютерная техника -> Комплектующие -> Жесткие диски (HDD и SSD)"
        * на странице категории присутствует секция "Производители"
        * я заполняю ссылки в секции "Производители" с параметрами:
        | название | значение                                |
        | feature  | Компьютерная техника -> Комплектующие -> Жесткие диски (HDD и SSD) |
        | category | Компьютерная техника -> Комплектующие -> Жесткие диски (HDD и SSD) |
        | section  | Производители                           |
        | field    | Марка                                   |
