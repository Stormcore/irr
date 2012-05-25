# encoding: utf-8

class CategoryBuildingElectricsPowerstationsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/electrics/powerstations"
  @category = "Строительство и ремонт -> Электрика -> Электростанции"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
