# encoding: utf-8

class CategoryGardenElementsToiletsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/elements/toilets"
  @category = "Все для дачи -> Садовая мебель, сантехника, декор -> Биотуалеты, рукомойники"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Вид", "type"
end
