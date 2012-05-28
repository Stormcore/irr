# encoding: utf-8

class CategoryGardenGrillGrillsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/grill/grills"
  @category = "Все для дачи -> Грили, мангалы -> Грили, мангалы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Вид устройства", "vid_ustroystva"
  irr_single_select "Тип", "type"
  irr_checkbox      "Складной", "garden_folding"
  irr_range_select  "Высота, мм", "height"
  irr_range_select  "Глубина, мм", "depth"
  irr_range_select  "Ширина, мм", "width"
  irr_range_select  "Вес, кг", "ves"
end
