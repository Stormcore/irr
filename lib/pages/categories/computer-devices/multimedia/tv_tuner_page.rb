# encoding: utf-8

class CategoryComputerDevicesMultimediaTVTunersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/multimedia/tv-tuners"
  @category = "Компьютерная техника -> Мультимедиа -> TV-тюнеры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
