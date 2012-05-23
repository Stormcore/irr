# encoding: utf-8

class CategoryComputerHardwarePSUPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/hardware/psu"
  @category = "Компьютерная техника -> Комплектующие -> Блоки питания"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
