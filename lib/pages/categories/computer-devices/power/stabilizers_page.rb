# encoding: utf-8

class CategoryComputerPowerStabilersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/power/network_filters_stabilizers"
  @category = "Компьютерная техника -> Источники питания -> Сетевые фильтры и стабилизаторы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
