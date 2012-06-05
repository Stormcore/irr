# encoding: utf-8

class CategoryFurnitureInteriorInteriorMirrorsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/interior/mirrors"
  @category = "Мебель, интерьер, обиход -> Интерьер -> Зеркала"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
