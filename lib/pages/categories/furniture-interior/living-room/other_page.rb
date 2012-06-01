# encoding: utf-8

class CategoryFurnitureInteriorLivingRoomOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/living-room/other"
  @category = "Мебель, интерьер, обиход -> Мебель для гостиной -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
