# encoding: utf-8

class CategoryFurnitureInteriorHomeStuffMatressPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/home-stuff/mattress"
  @category = "Мебель, интерьер, обиход -> Предметы обихода -> Матрасы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Назначение", "naznachenije"
  irr_multi_select "Вид", "type"
  irr_multi_select "Жесткость", "hardness"
  irr_multi_select "Основа", "base"
  irr_multi_select "Наполнитель", "material"
  irr_range_select "Ширина, cм", "width"
  irr_range_select "Высота, cм", "height"
  irr_range_select "Длина, cм", "length"
end
