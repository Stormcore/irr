# encoding: utf-8

class CategoryComputerDeviceskeyboardsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/keyboards/"
  @category = "Компьютерная техника -> Клавиатуры, мыши, игровые манипуляторы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
