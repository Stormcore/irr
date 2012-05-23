# encoding: utf-8

class CategoryComputerDevicesMultimediaheadphonesMicrophonesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/multimedia/headphones_microphones"
  @category = "Компьютерная техника -> Мультимедиа -> Наушники и микрофоны"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
