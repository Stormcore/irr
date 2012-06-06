# encoding: utf-8

class CategoryFurnitureInteriorOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/other"
  @category = "Мебель, интерьер, обиход -> Другая мебель"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
