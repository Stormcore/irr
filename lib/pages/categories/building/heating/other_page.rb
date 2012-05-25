# encoding: utf-8

class CategoryBuildingHeatingOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/heating/other"
  @category = "Строительство и ремонт -> Отопление -> Прочее"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
