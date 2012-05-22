# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDAmplifiersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/amplifiers"
  @category = "Электроника и техника -> Аудио, Видео -> Усилители"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
