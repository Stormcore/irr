# encoding: utf-8

class CategoryComputerDevicesPrintersMultifunctionPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/printers/multifunction"
  @category = "Компьютерная техника -> Принтеры, сканеры, копиры -> МФУ"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
