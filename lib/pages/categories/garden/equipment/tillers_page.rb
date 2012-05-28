# encoding: utf-8

class CategoryGardenEquipmentTillersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/equipment/tillers"
  @category = "Все для дачи -> Садовая техника -> Культиваторы, мотоблоки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Вид", "type"
  irr_single_select "Тип привода", "privod"
  irr_range_select "Мощность, л.с.", "power_output"
  irr_range_select "Ширина захвата, см", "shirina_zahvata"
  irr_range_select "Вес, кг", "ves"

end
