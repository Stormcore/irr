# encoding: utf-8

class CategoryComputerHardwareOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/hardware/other"
  @category = "Компьютерная техника -> Комплектующие -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
