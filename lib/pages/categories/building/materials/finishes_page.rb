# encoding: utf-8

class CategoryBuildingMaterialsFinishesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/materials/finishes"
  @category = "Строительство и ремонт -> Материалы -> Облицовочные и отделочные"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип материала", "type"
end
