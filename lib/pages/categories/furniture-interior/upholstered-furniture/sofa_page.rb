# encoding: utf-8

class CategoryFurnitureInteriorUphosteredFurnitureSofaPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/upholstered-furniture/sofa/"
  @category = "Мебель, интерьер, обиход -> Мягкая мебель -> Диваны"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Механизм раскладывания", "type"
  irr_multi_select "Материал", "material"
  irr_single_select "Угловой", "corner"
  irr_single_select "Раскладной", "folding"
end
