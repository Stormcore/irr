# encoding: utf-8

class CategoryFurnitureInteriorGardenFurniturePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/garden-furniture"
  @category = "Мебель, интерьер, обиход -> Садовая мебель"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
  irr_multi_select "Материал", "material"
  irr_checkbox     "Складной", "garden_folding"
end
