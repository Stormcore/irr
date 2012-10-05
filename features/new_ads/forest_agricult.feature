# language: ru
# encoding: utf-8

Функционал: Проверка необходимых полей в Спецтехника - cельхозтехника/лесотехника

  Контекст:
    * открыта главная страница

  Сценарий: Обязательные поля выделены звёздочкой
    Когда я вхожу под пользователем с логином "user_autotest" и паролем "testtest"
        * на главной странице я перехожу к подаче объявления
       То открыта страница выбора региона и категории
    Когда на странице выбора региона и категории я ввожу следующие данные:
          | поле   | значение                                 |
          | Регион | Москва                                   |
          | Раздел | Спецтехника - cельхозтехника/лесотехника |

        * я перехожу ко вводу деталей объявления
       То на странице ввода деталей обязательными являются следующие поля:
          | поле                    |
          | Тип предложения         |
          | Тип сельхоз/лесотехники |
          | Марка                   |
          | Модель                  |
          | Новый или подержанный   |

  Сценарий: Подача объявления с необходимыми полями
    Когда я вхожу под пользователем с логином "user_autotest" и паролем "testtest"
        * на главной странице я перехожу к подаче объявления
       То открыта страница выбора региона и категории
    Когда на странице выбора региона и категории я ввожу следующие данные:
          | поле   | значение                                 |
          | Регион | Москва                                   |
          | Раздел | Спецтехника - cельхозтехника/лесотехника |

        * я перехожу ко вводу деталей объявления
        * в секции "Основные данные" я ввожу следующие параметры:
          | поле                    | значение       |
          | Тип предложения         | продам         |
          | Тип сельхоз/лесотехники | лесовоз        |
          | Марка                   | Airman         |
          | Модель                  | AX33u          |
          | Новый или подержанный   | новый          |
          | Текст объявления        | Продам лесовоз |

        # не работает на тестовом сервере
        #* я загружаю фото при подаче объявления
        * я размещаю объявление
        * при подаче не показано сообщений об ошибке

       То открыт личный кабинет пользователя
        * в списке объявлений присутствует объявление с заголовком "Airman AX33u"
        * у выбранного объявления указан регион "Москва"
        * у выбранного объявления статус "Ожидает модерации"
        * у выбранного объявления показана фотография

    Когда я открываю детали выбранного объявления
        * в деталях объявления указаны следующие данные:
          | поле                    | заголовок      |
          | Тип предложения         | продам         |
          | Контактное лицо         | user_autotest  |
          | Рубрика                 | Спецтехника    |
          | Регион                  | Москва         |
          | Заголовок               | Airman AX33u   |
          | Тип сельхоз/лесотехники | лесовоз        |
          | Марка                   | Airman         |
          | Модель                  | AX33u          |
          | Описание                | Продам лесовоз |
          | Новый или подержанный   | новый          |
