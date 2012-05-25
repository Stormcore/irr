# encoding: utf-8

class CategoryBuildingMaterialsIsolationPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/materials/isolation"
  @category = "Строительство и ремонт -> Материалы -> Изоляционные материалы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип изоляции", "type"
end
