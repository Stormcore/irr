# encoding: utf-8

class CategoryFurnitureInteriorLivingRoomTablesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/living-room/tables"
  @category = "Мебель, интерьер, обиход -> Мебель для гостиной -> Столы, журнальные столики"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Материал", "material"
  irr_multi_select "Цвет", "color"
  irr_range_select "Ширина, см", "width"
  irr_range_select "Глубина, см", "depth"
end
