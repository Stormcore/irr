# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDAudioVideoAccessoriesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/audio-video-accessories"
  @category = "Электроника и техника -> Аудио, Видео -> Аксессуары для аудио-видео"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
