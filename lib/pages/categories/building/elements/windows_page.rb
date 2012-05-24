# encoding: utf-8

class CategoryBuildingElementsWindowsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/elements/windows"
  @category = "Строительство и ремонт -> Двери, окна, балконы, лестницы -> Окна, балконы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Материал", "material"
end
