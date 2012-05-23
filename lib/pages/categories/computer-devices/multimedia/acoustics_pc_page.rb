# encoding: utf-8

class CategoryComputerDevicesMultimediaAcousticsPCPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/multimedia/acoustics_pc"
  @category = "Компьютерная техника -> Мультимедиа -> Акустика для ПК"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_multi_select "Марка", "make"
end
