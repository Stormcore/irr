# encoding: utf-8

class CategoryComputerDevicesPrintersCopiersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/printers/copiers"
  @category = "Компьютерная техника -> Принтеры, сканеры, копиры -> Копиры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
