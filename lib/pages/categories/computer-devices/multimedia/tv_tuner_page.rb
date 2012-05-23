# encoding: utf-8

class CategoryComputerDevicesMultimediaTVTunersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/multimedia/tv_tuners"
  @category = "Компьютерная техника -> Мультимедиа -> TV-тюнеры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Новый или подержанный", "used-or-new"
end
