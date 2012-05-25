# encoding: utf-8

class CategoryBuildingPlumbingHeatersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/heaters"
  @category = "Строительство и ремонт -> Сантехника -> Водонагреватели"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
