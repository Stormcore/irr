# encoding: utf-8

class CategoryFurnitureInteriorKitchenOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/kitchen/other"
  @category = "Мебель, интерьер, обиход -> Мебель для кухни -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
