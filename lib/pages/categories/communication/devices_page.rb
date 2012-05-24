# encoding: utf-8

class CategoryCommunicationDevicesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/communication/devices/"
  @category = "Телефоны и связь -> Рации, переговорные устройства"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Дальность действия", "distance_of_signal"
end
