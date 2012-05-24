# encoding: utf-8

class CategoryBuildingElementsDoorsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/elements/doors"
  @category = "Строительство и ремонт -> Двери, окна, балконы, лестницы -> Двери"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип двери", "type"
end
