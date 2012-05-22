# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDVideoDVDPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/video-dvd"
  @category = "Электроника и техника -> Аудио, Видео -> Видеоплееры и рекордеры - DVD"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_checkbox "Портативная техника", "dvdportable"
end
