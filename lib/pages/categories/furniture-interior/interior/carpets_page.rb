# encoding: utf-8

class CategoryFurnitureInteriorInteriorCarpetsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/interior/carpets"
  @category = "Мебель, интерьер, обиход -> Интерьер -> Ковры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Форма", "type"
  irr_single_select "Материал", "material"
  irr_single_select "Тип рисунка", "painting"
  irr_range_select "Длина, см", "length"
  irr_range_select "Ширина, см", "width"
  irr_range_select "Диаметр, см", "diameter"
end
