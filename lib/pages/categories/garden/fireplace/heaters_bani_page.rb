# encoding: utf-8

class CategoryGardenFireplaceHeatersBaniPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/fireplace/heaters_bani"
  @category = "Все для дачи -> Камины, печи -> Печи для бани, сауны"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
  irr_range_select "Вес камней, кг", "bani_rock_weight"
  irr_range_select "Диаметр дымохода, мм", "chimney_size"
  irr_range_select "Высота, мм", "height"
  irr_range_select "Глубина, мм", "depth"
  irr_range_select "Ширина, мм", "width"
end
