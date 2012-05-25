# encoding: utf-8

class CategoryBuildingMaterialsGlassPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/materials/glass"
  @category = "Строительство и ремонт -> Материалы -> Стекло, стеклоизделия, светопрозрачные пластики"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
