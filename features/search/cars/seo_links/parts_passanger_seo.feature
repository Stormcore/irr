# language:ru
# encoding: utf-8
Функционал: Авто и мото -> Автозапчасти и принадлежности -> Для легковых автомобилей- seo-линки

  Контекст:
    Когда открыта страница для города "Москва"
        * на главной странице я перехожу в категорию "Авто и мото -> Автозапчасти и принадлежности -> Для легковых автомобилей"
        * на странице категории присутствует секция "Быстрый поиск"

@bugs @bug35582
  Структура сценария: Фильтр по модели
    Когда я выбираю ссылку "для <модель>" в секции "Быстрый поиск"
       То ссылка содержит "<часть ссылки>"

  Примеры:
  | модель     | часть ссылки |
  | Audi       | audi         |
  | BMW        | bmw          |
  | Chevrolet  | chevrolet    |
  | Citroen    | citroen      |
  | Daewoo     | daewoo       |
  | Fiat       | fiat         |
  | Ford       | ford         |
  | Honda      | honda        |
  | Hyundai    | hyundai      |
  | Kia        | kia          |
  | Lexus      | lexus        |
  | Mazda      | mazda        |
  | Mitsubishi | mitsubishi   |
  | Nissan     | nissan       |
  | Opel       | opel         |
  | Peugeot    | peugeot      |
  | Renault    | renault      |
  | Skoda      | skoda        |
  | Subaru     | subaru       |
  | Suzuki     | suzuki       |
  | Toyota     | toyota       |
  | Volkswagen | volkswagen   |
  | Volvo      | volvo        |
  | ВАЗ        | vaz          |