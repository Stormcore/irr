# encoding: utf-8

class CategoryComputerDevicesComputerAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/computer_accessories/"
  @category = "Компьютерная техника -> Компьютерные аксессуары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
