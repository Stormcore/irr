# encoding: utf-8

class CategoryElectronicsTechnicsTVAudioDVDTapeRecordersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/tv-audio-dvd/tape-recorders"
  @category = "Электроника и техника -> Аудио, Видео -> Магнитолы"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип магнитолы", "magnitola_type"
end
