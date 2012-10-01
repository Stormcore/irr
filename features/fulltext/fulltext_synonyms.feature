# language:ru
# encoding: utf-8
Функционал: Полнотекстовый поиск

  Контекст:
    Когда открыта страница для региона "Усть-Алтан"
       # * на главной странице я перехожу в категорию "Авто и мото -> Легковые автомобили -> Автомобили с пробегом"

  Сценарий: Поиск по заголовку
    Когда я ищу "Mazda"
        * на странице поиска загружен список результатов
       То на странице поиска показаны только объявления:
          | название                                          |
          | Mazda 323, внедорожник, 2001 г.в., автоматическая |
          | Mazda 616, комби, 2002 г.в., вариатор             |
          | Mazda 929, хэтчбек, 2003 г.в., роботизированная   |

  Сценарий: Поиск по синониму марки
    Когда я ищу "мазда"
        * на странице поиска загружен список результатов
       То на странице поиска показаны только объявления:
          | название                                          |
          | Mazda 323, внедорожник, 2001 г.в., автоматическая |
          | Mazda 616, комби, 2002 г.в., вариатор             |
          | Mazda 929, хэтчбек, 2003 г.в., роботизированная   |

  Сценарий: Поиск по синониму марки (часть слова - русские буквы)
    Когда я ищу "маzda"
        * на странице поиска загружен список результатов
       То на странице поиска показаны только объявления:
          | название                                          |
          | Mazda 323, внедорожник, 2001 г.в., автоматическая |
          | Mazda 616, комби, 2002 г.в., вариатор             |
          | Mazda 929, хэтчбек, 2003 г.в., роботизированная   |

  Сценарий: Поиск по синониму модели
    Когда я ищу "mazda 323"
        * на странице поиска загружен список результатов
       То на странице поиска показаны только объявления:
          | название                                          |
          | Mazda 323, внедорожник, 2001 г.в., автоматическая |

  Сценарий: Поиск по модели с опечаткой
    Когда я ищу "Фод Фокус"
        * на странице поиска загружен список результатов
       То на странице поиска показаны только объявления:
          | название                                     |
          | Ford Focus, стретч, 2004 г. в., механическая |

  Сценарий: Поиск по модификации
    Когда я ищу "AAA"
        * на странице поиска загружен список результатов
       То на странице поиска показаны только объявления:
          | название                                          |
          | Mazda 323, внедорожник, 2001 г.в., автоматическая |

  Сценарий: Поиск по типу кузова
    Когда я ищу "комби"
        * на странице поиска загружен список результатов
       То на странице поиска показаны только объявления:
          | название                                          |
          | Mazda 616, комби, 2002 г.в., вариатор             |

  Сценарий: Поиск по части из заголовка и текста
    Когда я ищу "мазда меняю"
        * на странице поиска загружен список результатов
       То на странице поиска показаны только объявления:
          | название                                          |
          | Mazda 616, комби, 2002 г.в., вариатор             |

  Сценарий: Поиск по синониму и региону
    Когда я ищу "мазда усть-алтан"
        * на странице поиска загружен список результатов
       То на странице поиска показаны только объявления:
          | название                                          |
          | Mazda 323, внедорожник, 2001 г.в., автоматическая |
          | Mazda 616, комби, 2002 г.в., вариатор             |
          | Mazda 929, хэтчбек, 2003 г.в., роботизированная   |