# encoding: utf-8

class CategoryFurnitureInteriorBedroomOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/bedroom/other"
  @category = "Мебель, интерьер, обиход -> Мебель для спальни -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
