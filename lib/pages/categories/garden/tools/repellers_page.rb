# encoding: utf-8

class CategoryGardenToolsRepellersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/tools/repellers"
  @category = "Все для дачи -> Садовые инструменты, инвентарь -> Средства от насекомых и грызунов"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
