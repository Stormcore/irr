# language:ru
# encoding: utf-8
Функционал: Электроника и техника -> Пылесосы

  Контекст:
    Когда открыта страница для региона "Россия"
        * на главной странице я перехожу в категорию "Электроника и техника -> Пылесосы"
        * на странице категории присутствует секция "Производители пылесосов"

  Структура сценария: Облако тегов марок
    Когда я перехожу по ссылке "<ссылка>"
       То открыта не страница 404
        * в поле "Марка" выбрано значение "<текст>"
        * на странице поиска загружен список результатов
        * на странице показано >= 1 объявлений

  Примеры: 
  | текст | ссылка |
  | Bosch | http://russia.irr.ru/electronics-technics/vacuum/bosch/ |
  | Daewoo | http://russia.irr.ru/electronics-technics/vacuum/daewoo/ |
  | Dyson | http://russia.irr.ru/electronics-technics/vacuum/dyson/ |
  | Electrolux | http://russia.irr.ru/electronics-technics/vacuum/electrolux/ |
  | Karcher | http://russia.irr.ru/electronics-technics/vacuum/karcher/ |
  | LG | http://russia.irr.ru/electronics-technics/vacuum/lg/ |
  | Miele | http://russia.irr.ru/electronics-technics/vacuum/miele/ |
  | Philips | http://russia.irr.ru/electronics-technics/vacuum/philips/ |
  | Rolsen | http://russia.irr.ru/electronics-technics/vacuum/rolsen/ |
  | Rowenta | http://russia.irr.ru/electronics-technics/vacuum/rowenta/ |
  | Samsung | http://russia.irr.ru/electronics-technics/vacuum/samsung/ |
  | Scarlett | http://russia.irr.ru/electronics-technics/vacuum/scarlett/ |
  | Supra | http://russia.irr.ru/electronics-technics/vacuum/supra/ |
  | Thomas | http://russia.irr.ru/electronics-technics/vacuum/thomas/ |
  | Vax | http://russia.irr.ru/electronics-technics/vacuum/vax/ |
  | Vitek | http://russia.irr.ru/electronics-technics/vacuum/vitek/ |
  | Zanussi | http://russia.irr.ru/electronics-technics/vacuum/zanussi/ |
  | Zelmer | http://russia.irr.ru/electronics-technics/vacuum/zelmer/ |
  | iRobot | http://russia.irr.ru/electronics-technics/vacuum/irobot/ |
  | Фея | http://russia.irr.ru/electronics-technics/vacuum/feya/ |
