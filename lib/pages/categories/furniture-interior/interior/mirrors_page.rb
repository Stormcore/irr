# encoding: utf-8

class CategoryFurnitureInteriorInteriorMirrorsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/interior/mirrors"
  @category = "Мебель, интерьер, обиход -> Интерьер -> Зеркала"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Форма", "type"
  irr_range_select "Длина, см", "length"
  irr_range_select "Ширина, см", "width"
end
