# encoding: utf-8

class CategoryBuildingMaterialsFasternersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/materials/fasteners"
  @category = "Строительство и ремонт -> Материалы -> Элементы крепежа"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип крепежа", "type"
end
