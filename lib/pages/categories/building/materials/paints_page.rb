# encoding: utf-8

class CategoryBuildingMaterialsPaintsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/materials/paints"
  @category = "Строительство и ремонт -> Материалы -> Лакокрасочные"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип материала", "type"
end
