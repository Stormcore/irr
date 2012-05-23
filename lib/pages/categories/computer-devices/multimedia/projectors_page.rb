# encoding: utf-8

class CategoryComputerDevicesMultimediaProjectorsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/multimedia/projectors"
  @category = "Компьютерная техника -> Мультимедиа -> Проекторы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
