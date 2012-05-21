# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsSpeakerphonesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/speakerphones"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип", "tip"
  irr_single_select "Источник питания спикерфона", "istochnik_pitanija_spikerfona"
  irr_checkbox      "Дисплей", "displej"
  irr_checkbox      "Возможность подключения к штатной акустике", "vozmojnost_podkluchenija_k_shtatnoy_akustike"
  irr_checkbox      "Подключение USB", "podkluchenie_usb"
  irr_checkbox      "Bluetooth", "bluetooth"
end
