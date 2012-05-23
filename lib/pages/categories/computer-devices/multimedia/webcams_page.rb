# encoding: utf-8

class CategoryComputerDevicesMultimediaWebcamsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/multimedia/webcams"
  @category = "Компьютерная техника -> Мультимедиа -> Веб-камеры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
