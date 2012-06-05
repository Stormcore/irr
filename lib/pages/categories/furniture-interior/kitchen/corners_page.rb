# encoding: utf-8

class CategoryFurnitureInteriorKitchenCornersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/kitchen/corners"
  @category = "Мебель, интерьер, обиход -> Мебель для кухни -> Кухонные уголки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Материал", "material"
  irr_multi_select "Материал обивки", "material_obivki"
end
