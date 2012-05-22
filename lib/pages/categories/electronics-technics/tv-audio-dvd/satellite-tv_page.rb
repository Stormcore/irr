# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDSatelliteTvPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/satellite-tv"
  @category = "Электроника и техника -> Аудио, Видео -> Спутниковое ТВ"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
