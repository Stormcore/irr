# encoding: utf-8

class CategoryFurnitureInteriorUpholsteredFurnitureChairsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/upholstered-furniture/chairs"
  @category = "Мебель, интерьер, обиход -> Мягкая мебель -> Кресла, пуфы, банкетки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
  irr_multi_select "Материал", "material"
  irr_single_select "Раскладной", "folding"
end
