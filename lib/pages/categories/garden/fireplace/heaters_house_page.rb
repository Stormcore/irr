# encoding: utf-8

class CategoryGardenFireplaceHeatersHousePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/fireplace/heaters_house"
  @category = "Все для дачи -> Камины, печи -> Печи для дома, дачи"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
  irr_single_select "Материал", "material"
  irr_checkbox     "Варочная панель", "cooking_panel"
  irr_checkbox     "Духовка", "oven" 
  irr_range_select "Длина полена, мм", "firewood_length"
  irr_range_select "Высота, мм", "height"
  irr_range_select "Глубина, мм", "depth"
  irr_range_select "Ширина, мм", "width"
end
