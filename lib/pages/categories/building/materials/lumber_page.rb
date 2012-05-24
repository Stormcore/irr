# encoding: utf-8

class CategoryBuildingMaterialsLumberPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/materials/lumber"
  @category = "Строительство и ремонт -> Материалы -> Лесопиломатериалы, столярные изделия"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип пиломатериала", "woodmaterial_type"
  irr_range_select "Высота, мм", "woodmaterial_height"
  irr_range_select "Ширина, мм", "woodmaterial_width"
  irr_range_select "Длина, мм", "woodmaterial_length"
end
