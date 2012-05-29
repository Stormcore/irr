# encoding: utf-8

class CategoryGardenFireplaceFireplacesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/fireplace/fireplaces"
  @category = "Все для дачи -> Камины, печи -> Камины"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
  irr_single_select "Расположение", "raspolozhenie"
  irr_single_select "Материал", "material"
  irr_range_select "Высота, мм", "height"
  irr_range_select "Глубина, мм", "depth"
  irr_range_select "Ширина, мм", "width"
end
