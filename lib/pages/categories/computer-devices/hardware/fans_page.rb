# encoding: utf-8

class CategoryComputerHardwareFansPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/hardware/fans"
  @category = "Компьютерная техника -> Комплектующие -> Вентиляторы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
