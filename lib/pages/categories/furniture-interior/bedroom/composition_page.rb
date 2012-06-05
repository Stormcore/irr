# encoding: utf-8

class CategoryFurnitureInteriorBedroomCompositionPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/bedroom/composition"
  @category = "Мебель, интерьер, обиход -> Мебель для спальни -> Спальные гарнитуры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Материал", "material"
  irr_multi_select "Цвет", "color"
end
