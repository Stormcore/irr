# encoding: utf-8

class CategoryBuildingPlumbingToiletsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/toilets"
  @category = "Строительство и ремонт -> Сантехника -> Унитазы, писсуары, биде"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
