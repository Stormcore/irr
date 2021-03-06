# language:ru
# encoding: utf-8
Функционал: Недвижимость - Дома, дачи. Аренда - seo-линки

  Контекст:
    Когда открыта страница для региона "Россия"
        * на главной странице я перехожу в категорию "Недвижимость -> Дома, дачи, участки. Аренда"
        * на странице категории присутствует секция "Быстрый поиск"

  Сценарий: Фильтр по аренде земельных участков
    Когда я выбираю ссылку "Коттедж на сутки" в секции "Быстрый поиск"
       То ссылка содержит "daily"
        * в поле "Срок сдачи" выбраны следующие значения:
          | value |
          | сутки |
