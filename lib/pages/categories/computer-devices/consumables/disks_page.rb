# encoding: utf-8

class CategoryComputerConsumablesDisksPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/consumables/disks"
  @category = "Компьютерная техника -> Расходные материалы -> Диски, дискеты, кассеты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
