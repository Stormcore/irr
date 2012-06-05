# encoding: utf-8

class CategoryFurnitureInteriorBedroomCupboardsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/bedroom/cupboards"
  @category = "Мебель, интерьер, обиход -> Мебель для спальни -> Шкафы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Материал", "material"
  irr_multi_select "Цвет", "color"
  irr_single_select "Купе", "kupe"
  irr_range_select "Ширина, см", "width"
  irr_range_select "Глубина, см", "depth"
  irr_range_select "Высота, см", "height"
end
