# encoding: utf-8

class CategoryEquipmentMachinesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/equipment/machines"
  @category = "Оборудование -> Станки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
