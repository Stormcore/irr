# encoding: utf-8

class CategoryBuildingMaterialsRoofFrontagePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/materials/roof-frontage"
  @category = "Строительство и ремонт -> Материалы -> Кровельные и фасадные материалы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
