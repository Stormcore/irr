# encoding: utf-8

class CategoryGardenToolsWateringPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/tools/watering"
  @category = "Все для дачи -> Садовые инструменты, инвентарь -> Товары для полива"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Вид", "type"
end
