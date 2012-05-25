# encoding: utf-8

class CategoryBuildingElectricsCablesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/electrics/cables"
  @category = "Строительство и ремонт -> Электрика -> Кабели, провода"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
