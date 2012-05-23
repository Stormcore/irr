# encoding: utf-8

class CategoryComputerHardwareMemoryModulesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/hardware/memory_modules"
  @category = "Компьютерная техника -> Комплектующие -> Модули памяти"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Объем памяти", "ram_size"
  irr_checkbox     "Для ноутбука", "ram_notebook"
end
