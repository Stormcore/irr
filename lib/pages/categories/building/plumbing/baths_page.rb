# encoding: utf-8

class CategoryBuildingPlumbingBathsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/plumbing/baths"
  @category = "Строительство и ремонт -> Сантехника -> Ванны"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
  irr_multi_select "Марка", "make"
  irr_multi_select "Материал", "make"
  irr_range_select "Длина, мм", "length"
  irr_range_select "Ширина, мм", "width"
  irr_range_select "Высота, мм", "height"
  irr_checkbox     "Гидромассаж", "hydromassage"
  irr_checkbox     "Аэромассаж", "aeromassage"
end
