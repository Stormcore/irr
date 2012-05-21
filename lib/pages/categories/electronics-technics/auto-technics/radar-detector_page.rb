# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsFMTransmittersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/radar-detector"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Диапазоны", "make"
  irr_single_select "Марка", "diapazoni"
  irr_single_select "Режимы", "rejimi"
  irr_checkbox      "Детектор лазера", "detector_lazera"
  irr_checkbox      "Пеленг лазера 360 гр.", "peleng_lazera"
  irr_checkbox      "Функция голосового сообщения", "funkcija_golosovogo_soobshenija"
  irr_single_select "Тип дисплея", "tip_displeja"
  irr_checkbox      "AutoMute", "automute"
end
