# encoding: utf-8

class CategoryBuildingVentilationPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/ventilation"
  @category = "Строительство и ремонт -> Вентиляционные системы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
