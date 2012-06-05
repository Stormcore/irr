# encoding: utf-8

class CategoryFurnitureInteriorHallwayCupboardsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/hallway/cupboards"
  @category = "Мебель, интерьер, обиход -> Мебель для прихожей -> Шкафы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Материал", "material"
  irr_single_select "Купе", "kupe"
  irr_multi_select "Цвет", "color"
end
