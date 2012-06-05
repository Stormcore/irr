# encoding: utf-8

class CategoryFurnitureInteriorKitchenTablesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/kitchen/tables"
  @category = "Мебель, интерьер, обиход -> Мебель для кухни -> Столы, стулья, столовые группы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Предмет мебели", "type"
  irr_single_select "Вид стола", "table_type"
  irr_multi_select "Материал", "material"
  irr_multi_select "Материал обивки", "material_obivki"
  irr_multi_select "Цвет", "color"
  irr_range_select "Ширина, см", "width"
  irr_range_select "Глубина, см", "depth"
  irr_range_select "Высота, см", "height"
end
