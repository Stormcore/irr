# encoding: utf-8

class CategoryGardenElementsFurniturePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/elements/furniture"
  @category = "Все для дачи -> Садовая мебель, сантехника, декор -> Мебель"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
  irr_single_select "Материал", "material"
  irr_checkbox     "Складной", "garden_folding"
end
