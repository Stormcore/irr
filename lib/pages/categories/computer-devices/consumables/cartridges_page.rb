# encoding: utf-8

class CategoryComputerConsumablesCartridgesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/consumables/cartridges"
  @category = "Компьютерная техника -> Расходные материалы -> Картриджи"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
