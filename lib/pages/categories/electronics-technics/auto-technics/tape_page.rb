# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsTapePage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/tape"
  @category = "Электроника и техника -> Техника для авто -> Автомагнитолы"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип магнитолы", "caraudio_type"
  irr_single_select "Типоразмер", "tiporazmer"
  irr_range_select "Выходная мощность", "output_volume"
  irr_range_select "Число линейных аудиовыходов", "chislo_linejnyh_audiooutput"
  irr_checkbox     "Выход для сабвуфера", "subvufer_output"
  irr_checkbox     "Пульт ДУ", "pult_distancionnogo_upravlenija"
  irr_checkbox     "Съемная панель", "semnaja_panel"
  irr_single_select "Тип дисплея", "tip_displeja"
  irr_checkbox     "Сенсорный дисплей", "sensor_display"
  irr_checkbox     "Встроенный GPS-приемник", "gps_inbuild"
  irr_checkbox     "Поддержка iPod", "ipod_podderzhka"
  irr_checkbox     "Поддержка MPEG4", "mpeg4_podderzhka"
  irr_checkbox     "Вход аудио на передней панели", "audio_input_front"
  irr_checkbox     "Bluetooth", "bluetooth"
  irr_single_select "Поддержка карт памяти", "podderjka_kart_pamyati"
end
