# encoding: utf-8

class CategoryFurnitureInteriorBathroomItemsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/bathroom-items"
  @category = "Мебель, интерьер, обиход -> Товары для ванной и туалета"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
end
