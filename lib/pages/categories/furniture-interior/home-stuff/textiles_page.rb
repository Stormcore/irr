# encoding: utf-8

class CategoryFurnitureInteriorHomeStuffTextilesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/home-stuff/textiles"
  @category = "Мебель, интерьер, обиход -> Предметы обихода -> Текстиль"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
  irr_range_select "Ширина, см", "width"
  irr_range_select "Длина, см", "length"
end
