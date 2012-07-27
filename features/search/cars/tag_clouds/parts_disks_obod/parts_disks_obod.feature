# language:ru
# encoding: utf-8
Функционал: Авто и мото -> Автозапчасти и принадлежности -> Диски - диаметр обода

  Контекст:
    Когда открыта страница для региона "Россия"
        * на главной странице я перехожу в категорию "Авто и мото -> Автозапчасти и принадлежности -> Диски"
        * на странице категории присутствует секция "Диаметр обода"

  Структура сценария: Облако тегов марок
    Когда я перехожу по ссылке "<ссылка>"
       То открыта не страница 404
        * в поле "Диаметр обода" выбрано значение "<текст>"
        * на странице поиска загружен список результатов
        * на странице показано >= 1 объявлений

  Примеры: 
  | текст | ссылка |
  | 12 | http://russia.irr.ru/cars/parts/disks/12/ |
  | 13 | http://russia.irr.ru/cars/parts/disks/13/ |
  | 14 | http://russia.irr.ru/cars/parts/disks/14/ |
  | 15 | http://russia.irr.ru/cars/parts/disks/15/ |
  | 16 | http://russia.irr.ru/cars/parts/disks/16/ |
  | 17 | http://russia.irr.ru/cars/parts/disks/17/ |
  | 18 | http://russia.irr.ru/cars/parts/disks/18/ |
  | 19 | http://russia.irr.ru/cars/parts/disks/19/ |
  | 20 | http://russia.irr.ru/cars/parts/disks/20/ |
  | 21 | http://russia.irr.ru/cars/parts/disks/21/ |
  | 22 | http://russia.irr.ru/cars/parts/disks/22/ |
  | 24 | http://russia.irr.ru/cars/parts/disks/24/ |
