# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDDictophonesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/dictophones"
  @category = "Электроника и техника -> Аудио, Видео -> Диктофоны"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
