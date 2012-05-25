# encoding: utf-8

class CategoryBuildingHeatingSystemsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/heating/systems"
  @category = "Строительство и ремонт -> Отопление -> Системы отопления"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
