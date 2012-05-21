# encoding: utf-8

class CategoryCarsPartsPassengerPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/passenger"
  @category = "Авто и мото -> Автозапчасти и принадлежности -> Для легковых автомобилей"

  irr_multi_select "Марка", "make"

end
