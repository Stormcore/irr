# encoding: utf-8

class CategoryCarsPartsAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/accessories"
  @category = "Авто и мото -> Автозапчасти и принадлежности -> Аксессуары"

  irr_multi_select "Источник", "sourcefrom"

end
