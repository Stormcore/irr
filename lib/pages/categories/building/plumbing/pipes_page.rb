# encoding: utf-8

class CategoryBuildingPlumbingPipesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/pipes"
  @category = "Строительство и ремонт -> Сантехника -> Трубы, сантехническая арматура"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
