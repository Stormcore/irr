# encoding: utf-8

class CategoryGardenToolsPumpsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/tools/pumps"
  @category = "Все для дачи -> Садовые инструменты, инвентарь -> Насосы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Тип насоса", "type"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_range_select "Глубина погружения, м", "glubina_pogruzhenija"
  irr_range_select "Максимальный напор, м", "maksimalnyj_napor"
  irr_range_select "Потребляемая мощность, Вт", "potrebljaemaja_moshchnost"
  irr_range_select "Объем гидробака, л", "objem_gidrobaka"
  irr_single_select "Качество воды", "kachestvo_vody"
  irr_range_select "Пропускная способность, куб. м/час", "propusknaja_sposobnost"
  irr_range_select "Длина сетевого шнура, м", "dlina_setevogo_shnura"
  irr_single_select "Установка насоса", "ustanovka_nasosa"
  irr_checkbox      "Защита от перегрева", "zashchita_ot_peregreva"
  irr_single_select "Механизм насоса", "mehanizm_nasosa"
  irr_range_select "Глубина до зеркала воды, м", "glubina_do_zerkala_vody"
  irr_range_select "Вес, кг", "ves"
end
