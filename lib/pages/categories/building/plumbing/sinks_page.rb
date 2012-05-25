# encoding: utf-8

class CategoryBuildingPlumbingSinksPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/sinks"
  @category = "Строительство и ремонт -> Сантехника -> Кухонные мойки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
