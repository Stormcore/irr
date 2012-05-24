# encoding: utf-8

class CategoryComputerDevicesOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/other/"
  @category = "Компьютерная техника -> Другое"

  irr_multi_select "Тип предложения", "offertype"
end
