# encoding: utf-8

class CategoryBuildingMaterialsLumberPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/materials/lumber"
  @category = "Строительство и ремонт -> Материалы -> Лесопиломатериалы, столярные изделия"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип пиломатериала", "woodmaterial_type"
  irr_range_select "Высота", "woodmaterial_height"
  irr_range_select "Ширина", "woodmaterial_width"
  irr_range_select "Длина", "woodmaterial_length"

  def get_parameter(field)
    case field
    when "Высота", "Ширина", "Длина"
      super(field).gsub(/ мм/,'')
    else
      super(field)
    end
  end
end
