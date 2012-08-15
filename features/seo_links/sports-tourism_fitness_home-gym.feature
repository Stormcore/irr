# language:ru
# encoding: utf-8
Функционал: Спорт, туризм, отдых -> Фитнес, атлетика, борьба -> Тренажеры, спорткомплексы - seo-линки

  Контекст:
    Когда открыта страница для города "Москва"
        * на главной странице я перехожу в категорию "Спорт, туризм, отдых -> Фитнес, атлетика, борьба -> Тренажеры, спорткомплексы"
        * на странице категории присутствует секция "Быстрый поиск"

  Сценарий: Фильтр по беговым дорожкам
    Когда я выбираю ссылку "Беговые дорожки" в секции "Быстрый поиск"
       То ссылка содержит "run-track"
        * в поле "Тип тренажера" равно "беговые дорожки"

  Сценарий: Фильтр по велотренажерам
    Когда я выбираю ссылку "Велотренажёры" в секции "Быстрый поиск"
       То ссылка содержит "fitness-cycle"
        * в поле "Тип тренажера" равно "велотренажеры"
