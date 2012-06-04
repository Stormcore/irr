# encoding: utf-8

class CategoryGardenElementsDecorationsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/elements/decorations"
  @category = "Все для дачи -> Садовая мебель, сантехника, декор -> Декор"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Вид", "type"
end
