# encoding: utf-8

class CategoryGardenEquipmentSnowPlowersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/equipment/snow_plowers"
  @category = "Все для дачи -> Садовая техника -> Снегоуборщики"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип привода", "privod"
  irr_range_select "Ширина очистки, см", "shirina_ochistki"
  irr_range_select "Мощность двигателя, л.с.", "power_output"
  irr_range_select "Вес, кг", "ves"

end
