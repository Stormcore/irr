# encoding: utf-8

class CategoryBuildingElementsLaddersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/elements/ladders"
  @category = "Строительство и ремонт -> Двери, окна, балконы, лестницы -> Лестницы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
