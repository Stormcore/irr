# encoding: utf-8

class CategoryBuildingHeatingFireplacesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/heating/fireplaces"
  @category = "Строительство и ремонт -> Отопление -> Камины, печи, дымоходы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
