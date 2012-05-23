# encoding: utf-8

class CategoryComputerDevicesPDAsAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/pdas_communicators/accessories"
  @category = "Компьютерная техника -> КПК -> Аксессуары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"

end
