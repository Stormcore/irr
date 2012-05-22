# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDKaraokePage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/karaoke"
  @category = "Электроника и техника -> Аудио, Видео -> Караоке"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
