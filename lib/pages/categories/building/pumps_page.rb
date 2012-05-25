# encoding: utf-8

class CategoryBuildingPumpsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/pumps"
  @category = "Строительство и ремонт -> Насосы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип насоса", "type"
  irr_multi_select "Марка", "make"
end
