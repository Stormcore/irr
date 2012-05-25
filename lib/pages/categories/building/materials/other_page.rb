# encoding: utf-8

class CategoryBuildingMaterialsOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/materials/other"
  @category = "Строительство и ремонт -> Материалы -> Прочие"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
