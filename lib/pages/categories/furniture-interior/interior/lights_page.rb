# encoding: utf-8

class CategoryFurnitureInteriorInteriorLightsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/interior/lights"
  @category = "Мебель, интерьер, обиход -> Интерьер -> Освещение"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
end
