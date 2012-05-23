# encoding: utf-8

class CategoryComputerDevicesServersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/servers/"
  @category = "Компьютерная техника -> Серверы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Новый или подержанный", "used-or-new"

end
