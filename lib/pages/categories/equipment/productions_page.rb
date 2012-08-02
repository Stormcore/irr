# encoding: utf-8

class CategoryEquipmentProductionsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/equipment/production"
  @category = "Оборудование -> Станки, производственное и обрабатывающее оборудование"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип оборудования", "advert_type_id"
end
