# encoding: utf-8

class CategoryFurnitureInteriorUpholsteredFurnitureOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/upholstered-furniture/other"
  @category = "Мебель, интерьер, обиход -> Мягкая мебель -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
