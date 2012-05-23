# encoding: utf-8

class CategoryComputerDevicesMultimediaVideoConferencesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/multimedia/videoconferences"
  @category = "Компьютерная техника -> Мультимедиа -> Оборудование для видеоконференций"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
