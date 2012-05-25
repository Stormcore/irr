# encoding: utf-8

class CategoryBuildingPlumbingPoolsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/pools"
  @category = "Строительство и ремонт -> Сантехника -> Бассейны"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
