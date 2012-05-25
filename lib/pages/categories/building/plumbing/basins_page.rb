# encoding: utf-8

class CategoryBuildingPlumbingBasinsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/basins"
  @category = "Строительство и ремонт -> Сантехника -> Раковины, умывальники"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
