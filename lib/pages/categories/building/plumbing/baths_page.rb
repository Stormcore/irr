# encoding: utf-8

class CategoryBuildingPlumbingBathsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/baths"
  @category = "Строительство и ремонт -> Сантехника -> Ванны"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
  irr_multi_select "Марка", "make"
  irr_multi_select "Материал", "material"
  irr_range_select "Длина", "length"
  irr_range_select "Ширина", "width"
  irr_range_select "Высота", "height"
  irr_checkbox     "Гидромассаж", "hydromassage"
  irr_checkbox     "Аэромассаж", "aeromassage"

  def get_parameter(field)
    case field
    when "Длина", "Ширина", "Высота"
      super(field).gsub(/ мм/,'')
    else
      super(field)
    end
  end
end
