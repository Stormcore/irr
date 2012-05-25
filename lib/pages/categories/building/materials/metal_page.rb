# encoding: utf-8

class CategoryBuildingMaterialsMetalPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/materials/metal"
  @category = "Строительство и ремонт -> Материалы -> Металлопрокат, арматура, металлоизделия"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
