# encoding: utf-8

class CategoryComputerHardwareCasesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/hardware/cases"
  @category = "Компьютерная техника -> Комплектующие -> Корпуса"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
