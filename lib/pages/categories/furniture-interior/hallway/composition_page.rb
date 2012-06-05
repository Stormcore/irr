# encoding: utf-8

class CategoryFurnitureInteriorHallwayCompositionPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/hallway/composition"
  @category = "Мебель, интерьер, обиход -> Мебель для прихожей -> Готовые гарнитуры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Материал", "material"
  irr_multi_select "Цвет", "color"
end
