# encoding: utf-8

class CategoryBuildingHeatingRadiatorsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/heating/radiators"
  @category = "Строительство и ремонт -> Отопление -> Радиаторы, конвекторы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
