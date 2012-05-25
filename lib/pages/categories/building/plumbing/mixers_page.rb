# encoding: utf-8

class CategoryBuildingPlumbingMixersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/mixers"
  @category = "Строительство и ремонт -> Сантехника -> Смесители"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип", "type"
  irr_multi_select "Назначение", "application"
  irr_multi_select "Покрытие", "covering"
end
