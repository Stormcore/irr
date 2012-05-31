# encoding: utf-8

class CategoryBuildingPlumbingOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/other"
  @category = "Строительство и ремонт -> Сантехника -> Прочее"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип сантехники", "type"
end
