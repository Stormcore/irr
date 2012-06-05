# encoding: utf-8

class CategoryFurnitureInteriorInteriorDecorationsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/interior/decorations"
  @category = "Мебель, интерьер, обиход -> Интерьер -> Элементы декора"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Тип", "type"
end
