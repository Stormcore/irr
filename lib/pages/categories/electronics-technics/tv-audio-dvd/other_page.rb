# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDOtherPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/other"
  @category = "Электроника и техника -> Аудио, Видео -> Другое"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
