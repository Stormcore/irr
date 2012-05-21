# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsDVRPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/dvr"
  @category = "Электроника и техника -> Техника для авто -> Автомобильные видеорегистраторы"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Конструкция", "konstrukcija"
  irr_single_select "Макс. разрешение видеозаписи", "maks_razreshenije_videozapisi"
  irr_range_select  "Угол обзора", "ugol_obzora"
  irr_checkbox      "Датчик движения", "datchik_dvijenija_g_sensor"
  irr_checkbox      "Экран", "ekran"
  irr_single_select "Поддержка карт памяти", "podderjka_kart_pamyati"
  irr_single_select "Режим записи", "rejim_zapisi"
end
