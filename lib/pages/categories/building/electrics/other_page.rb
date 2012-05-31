# encoding: utf-8

class CategoryBuildingElectricsOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/electrics/other"
  @category = "Строительство и ремонт -> Электрика -> Прочее"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип электрики", "type"
end
