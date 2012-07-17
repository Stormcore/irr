# encoding: utf-8

class CategoryComputerDevicesDesktopsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/desktops/"
  @category = "Компьютерная техника -> Настольные компьютеры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"

end
