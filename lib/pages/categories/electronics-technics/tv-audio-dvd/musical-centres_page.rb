# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDMusicalCentresPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/musical-centres"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип носителя", "recordplayer_type"
end
