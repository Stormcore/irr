# encoding: utf-8

class CategoryFurnitureInteriorInteriorOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/interior/other"
  @category = "Мебель, интерьер, обиход -> Интерьер -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
