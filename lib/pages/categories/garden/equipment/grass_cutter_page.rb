# encoding: utf-8

class CategoryGardenEquipmentGrassCutterPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/equipment/grass_cutter"
  @category = "Все для дачи -> Садовая техника -> Газонокосилки, триммеры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_single_select "Тип", "tip"
  irr_single_select "Тип двигателя", "tip_dvigatelja"
  irr_range_select "Ширина скашивания, см", "shirina_skashivanija"
  irr_checkbox     "Травосборник", "travosbornik"
  irr_range_select "Мощность, Вт", "power_output"
  irr_range_select "Вес, кг", "ves"
  irr_checkbox     "Самоходная", "self_moving_grasscutter"
  irr_single_select "Привод", "drive"
  irr_checkbox     "Мульчирование", "mulchirovanie"
  irr_single_select "Выброс травы", "vybros_travy"
  irr_range_select "Уровень шума, дБ", "uroven_shuma"
end
