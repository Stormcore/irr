# encoding: utf-8

class CategoryFurnitureInteriorKitchenCompositionPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/kitchen/composition"
  @category = "Мебель, интерьер, обиход -> Мебель для кухни -> Кухонные гарнитуры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Материал", "material"
  irr_multi_select "Цвет", "color"
  irr_single_select "Угловая", "corner"
end
