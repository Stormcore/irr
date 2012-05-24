# encoding: utf-8

class CategoryBuildingMaterialsConcretePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/materials/concrete"
  @category = "Строительство и ремонт -> Материалы -> ЖБИ, бетон, кирпич, сухие смеси"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип материала", "type"
end
