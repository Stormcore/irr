# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDCamerasPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/cameras"
  @category = "Электроника и техника -> Аудио, Видео -> Видеокамеры"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
