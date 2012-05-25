# encoding: utf-8

class CategoryBuildingPlumbingDouchecabinsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/douchecabins"
  @category = "Строительство и ремонт -> Сантехника -> Душевые кабины"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
  irr_multi_select "Марка", "make"
  irr_range_select "Длина, мм", "length"
  irr_range_select "Ширина, мм", "width"
  irr_range_select "Высота, мм", "height"
end
