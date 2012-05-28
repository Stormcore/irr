# encoding: utf-8

class CategoryGardenToolsHandtoolsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/tools/handtools"
  @category = "Все для дачи -> Садовые инструменты, инвентарь -> Садовые инструменты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Вид", "type"
end
