# encoding: utf-8

class CategoryBuildingElementsAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/elements/accessories"
  @category = "Строительство и ремонт -> Двери, окна, балконы, лестницы -> Замки, фурнитура и комплектующие"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Товар", "type"
end
