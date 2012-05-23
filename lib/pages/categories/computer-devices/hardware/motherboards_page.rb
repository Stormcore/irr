# encoding: utf-8

class CategoryComputerHardwareMotherboardsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/hardware/motherboards"
  @category = "Компьютерная техника -> Комплектующие -> Материнские платы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Производитель процессора", "cpu_producer"
end
