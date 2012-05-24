# encoding: utf-8

class CategoryComputerPowerUPSPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/power/ups"
  @category = "Компьютерная техника -> Источники питания -> UPS"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
