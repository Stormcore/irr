# encoding: utf-8

class CategoryBuildingOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/other"
  @category = "Строительство и ремонт -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
