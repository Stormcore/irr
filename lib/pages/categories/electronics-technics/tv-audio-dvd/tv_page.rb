# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDTvPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/tv"
  @category = "Электроника и техника -> Аудио, Видео -> Телевизоры и плазменные панели"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип экрана", "tv_type"
  irr_range_select "Диагональ", "tv_diag"
end
