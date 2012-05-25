# encoding: utf-8

class CategoryBuildingPlumbingTowelrailsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/towelrails"
  @category = "Строительство и ремонт -> Сантехника -> Полотенцесушители"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
