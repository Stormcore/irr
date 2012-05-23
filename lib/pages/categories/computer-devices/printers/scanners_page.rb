# encoding: utf-8

class CategoryComputerDevicesPrintersScannersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/printers/scanners"
  @category = "Компьютерная техника -> Принтеры, сканеры, копиры -> Сканеры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
