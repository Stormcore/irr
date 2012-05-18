# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsTVPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/tv"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип установки", "tip"
  irr_range_select  "Диагональ дисплея", "diagonal_displejya"
  irr_checkbox      "Встроенный TV-тюнер", "tv_tuner"
  irr_checkbox      "Встроенный FM-тюнер", "fm_tuner"
  irr_checkbox      "Подключение USB", "podkluchenie_usb"
end
