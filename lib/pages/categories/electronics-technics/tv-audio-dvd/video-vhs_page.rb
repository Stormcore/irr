# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDVideoVHSPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/video-vhs"
  @category = "Электроника и техника -> Аудио, Видео -> Видеоплееры и рекордеры - VHS"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
