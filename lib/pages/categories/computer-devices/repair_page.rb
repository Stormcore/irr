# encoding: utf-8

class CategoryComputerDevicesRepairPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/repair/"
  @category = "Компьютерная техника -> Ремонт и сервис"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
