# encoding: utf-8

class CategoryFurnitureInteriorBedroomBedsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/bedroom/beds"
  @category = "Мебель, интерьер, обиход -> Мебель для спальни -> Кровати"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
  irr_multi_select "Материал", "material"
  irr_multi_select "Цвет", "color"
  irr_range_select "Ширина, см", "width"
  irr_range_select "Длина, см", "length"
end
