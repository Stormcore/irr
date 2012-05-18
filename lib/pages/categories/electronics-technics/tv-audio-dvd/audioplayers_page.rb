# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDAudioPlayersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/audioplayers"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип плеера", "cdmp3play_type"
end
