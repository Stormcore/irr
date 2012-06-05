# encoding: utf-8

class CategoryFurnitureInteriorHallwayStandsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/hallway/stands"
  @category = "Мебель, интерьер, обиход -> Мебель для прихожей -> Полки, тумбы для обуви"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
  irr_multi_select "Материал", "material"
  irr_multi_select "Цвет", "color"
  irr_range_select "Ширина, см", "width"
  irr_range_select "Глубина, см", "depth"
  irr_range_select "Высота, см", "heigth"
end
