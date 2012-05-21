# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsFMTransmittersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/fm-transmitters"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_checkbox      "Дисплей", "displej"
  irr_checkbox      "Пульт дистанционного управления", "pult_distancionnogo_upravlenija"
  irr_checkbox      "Работа от прикуривателя", "rabota_ot_prikurivatelja"
  irr_checkbox      "USB-порт", "usb_port"
  irr_checkbox      "Слот для карт памяти", "slot_dlja_kart_pamyati"
  irr_checkbox      "MP3-проигрыватель", "mp3_proigrivatel"
  irr_checkbox      "Bluetooth", "bluetooth"
end
