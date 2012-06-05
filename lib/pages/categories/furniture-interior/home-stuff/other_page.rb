# encoding: utf-8

class CategoryFurnitureInteriorHomeStuffOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/home-stuff/other"
  @category = "Мебель, интерьер, обиход -> Предметы обихода -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
