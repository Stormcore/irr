# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDEarPhonesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/ear-phones"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_radio_select "Вид", "headphones_wire"
end
