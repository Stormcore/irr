# encoding: utf-8

class CategoryGardenToolsWheelbarrowsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/tools/wheelbarrows"
  @category = "Все для дачи -> Садовые инструменты, инвентарь -> Тачки, тележки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
