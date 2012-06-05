# encoding: utf-8

class CategoryFurnitureInteriorHallwayOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/hallway/other"
  @category = "Мебель, интерьер, обиход -> Мебель для прихожей -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
