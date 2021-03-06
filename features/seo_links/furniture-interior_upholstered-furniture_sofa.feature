# language:ru
# encoding: utf-8
Функционал: Мебель, интерьер, обиход -> Мягкая мебель -> Диваны - seo-линки

  Контекст:
    Когда открыта страница для региона "Россия"
        * на главной странице я перехожу в категорию "Мебель, интерьер, обиход -> Мягкая мебель -> Диваны"
        * на странице категории присутствует секция "Быстрый поиск"

  Сценарий: Фильтр по угловым
    Когда я выбираю ссылку "Угловые диваны" в секции "Быстрый поиск"
       То ссылка содержит "uglovoy"
        * в поле "Угловой" выбрано значение "да"

  Сценарий: Фильтр по раскладным
    Когда я выбираю ссылку "Раскладные диваны" в секции "Быстрый поиск"
       То ссылка содержит "raskladnoy"
        * в поле "Раскладной" выбрано значение "да"

  Сценарий: Фильтр по кожаным
    Когда я выбираю ссылку "Кожаные диваны" в секции "Быстрый поиск"
       То ссылка содержит "kozha"
        * в поле "Материал" выбраны следующие значения:
          | value |
          | кожа  |
