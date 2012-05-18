# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDAcousticsPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/acoustics"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Акустика", "acoustipart_type"
  irr_single_select "Тип", "acoustic_type"
end
