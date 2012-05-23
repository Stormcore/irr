# encoding: utf-8

class CategoryComputerDevicesMultimediaGraphicTablesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/multimedia/graphic_tablets"
  @category = "Компьютерная техника -> Мультимедиа -> Графические планшеты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
