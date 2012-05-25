# encoding: utf-8

class CategoryBuildingPlumbingDouchecabinsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/douchecabins"
  @category = "Строительство и ремонт -> Сантехника -> Душевые кабины"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
  irr_multi_select "Марка", "make"
  irr_range_select "Длина", "length"
  irr_range_select "Ширина", "width"
  irr_range_select "Высота", "height"

  def get_parameter(field)
    case field
    when "Длина", "Ширина", "Высота"
      super(field).gsub(/ мм/,'')
    else
      super(field)
    end
  end
end
