# encoding: utf-8

class CategoryEquipmentCleaningPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/equipment/cleaning"
  @category = "Оборудование -> Чистящая и моющая техника"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
