# language:ru
# encoding: utf-8
Функционал: Строительство и ремонт -> Сантехника -> Ванны - seo-линки

  Контекст:
    Когда открыта страница для города "Москва"
        * на главной странице я перехожу в категорию "Строительство и ремонт -> Сантехника -> Ванны"
        * на странице категории присутствует секция "Быстрый поиск"

  Сценарий: Фильтр по акриловым
    Когда я выбираю ссылку "Акриловые ванны" в секции "Быстрый поиск"
       То ссылка содержит "acryl"
        * в поле "Материал" выбраны следующие значения:
          | value |
          | акрил |

  Сценарий: Фильтр по чугунным
    Когда я выбираю ссылку "Чугунные ванны" в секции "Быстрый поиск"
       То ссылка содержит "iron"
        * в поле "Материал" выбраны следующие значения:
          | value |
          | чугун |

  Сценарий: Фильтр по стальным
    Когда я выбираю ссылку "Стальные ванны" в секции "Быстрый поиск"
       То ссылка содержит "steel"
        * в поле "Материал" выбраны следующие значения:
          | value |
          | сталь |

  Сценарий: Фильтр по стеклянным
    Когда я выбираю ссылку "Стеклянные ванны" в секции "Быстрый поиск"
       То ссылка содержит "glass"
        * в поле "Материал" выбраны следующие значения:
          | value  |
          | стекло |

  Сценарий: Фильтр по деревянным
    Когда я выбираю ссылку "Деревянным ванны" в секции "Быстрый поиск"
       То ссылка содержит "wood"
        * в поле "Материал" выбраны следующие значения:
          | value  |
          | дерево |

  Сценарий: Фильтр по квариловым
    Когда я выбираю ссылку "Квариловые ванны" в секции "Быстрый поиск"
       То ссылка содержит "quaryl"
        * в поле "Материал" выбраны следующие значения:
          | value  |
          | кварил |

  Сценарий: Фильтр по ваннам из искусственного камня
    Когда я выбираю ссылку "Ванны из искусственного камня" в секции "Быстрый поиск"
       То ссылка содержит "stone"
        * в поле "Материал" выбраны следующие значения:
          | value      |
          | иск. камня |

  Сценарий: Фильтр по гидромассажным
    Когда я выбираю ссылку "Гидромассажные ванны" в секции "Быстрый поиск"
       То ссылка содержит "hydromassage"
        * поле "Гидромассаж" отмечено

  Сценарий: Фильтр по аэромассажным
    Когда я выбираю ссылку "Ванны с аэромассажем" в секции "Быстрый поиск"
       То ссылка содержит "aeromassage"
        * поле "Аэромассаж" отмечено
