# language:ru
# encoding: utf-8
Функционал: Одежда, обувь, аксессуары -> Мужская обувь - заполнение

  Контекст:
    Когда открыта страница для региона "Россия"

  Сценарий: Одежда, обувь, аксессуары -> Мужская обувь
      Когда на главной странице я перехожу в категорию "Одежда, обувь, аксессуары -> Мужская обувь"
        * на странице категории присутствует секция "Сезонность"
        * я заполняю ссылки в секции "Сезонность" с параметрами:
        | название | значение                                   |
        | feature  | Одежда, обувь, аксессуары -> Мужская обувь |
        | category | Одежда, обувь, аксессуары -> Мужская обувь |
        | section  | Сезонность                                 |
        | field    | Сезонность                                 |
