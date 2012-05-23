# encoding: utf-8

class CategoryComputerDevicesPrintersPrintPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/printers/printers"
  @category = "Компьютерная техника -> Принтеры, сканеры, копиры -> Принтеры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип", "type"

end
