# encoding: utf-8

class CategoryComputerDevicesPDAsPDAPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/pdas_communicators/accessories"
  @category = "Компьютерная техника -> КПК -> Аксессуары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Новый или подержанный", "used-or-new"

end
