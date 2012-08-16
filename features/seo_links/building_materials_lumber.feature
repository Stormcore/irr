# language:ru
# encoding: utf-8
Функционал: Строительство и ремонт -> Материалы -> Лесопиломатериалы, столярные изделия - seo-линки

  Контекст:
    Когда открыта страница для города "Москва"
        * на главной странице я перехожу в категорию "Строительство и ремонт -> Материалы -> Лесопиломатериалы, столярные изделия"
        * на странице категории присутствует секция "Быстрый поиск"

  Сценарий: Фильтр по брусу
    Когда я выбираю ссылку "Брус" в секции "Быстрый поиск"
       То ссылка содержит "beam"
        * значение в поле "Ключевые слова" равно "брус"

  Сценарий: Фильтр по вагонке
    Когда я выбираю ссылку "Вагонка" в секции "Быстрый поиск"
       То ссылка содержит "lining"
        * значение в поле "Ключевые слова" равно "вагонка"

  Сценарий: Фильтр по доскам
    Когда я выбираю ссылку "Доска" в секции "Быстрый поиск"
       То ссылка содержит "board"
        * значение в поле "Ключевые слова" равно "доска"

  Сценарий: Фильтр по половым доскам
    Когда я выбираю ссылку "Половая доска" в секции "Быстрый поиск"
       То ссылка содержит "thick-plank"
        * значение в поле "Ключевые слова" равно "половая доска"

  Сценарий: Фильтр по фанере
    Когда я выбираю ссылку "Фанера" в секции "Быстрый поиск"
       То ссылка содержит "plywood"
        * значение в поле "Ключевые слова" равно "фанера"