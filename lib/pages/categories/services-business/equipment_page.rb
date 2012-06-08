# encoding: utf-8

class CategoryServicesBusinessEquipmentPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/equipment"
  @category = "Услуги и деятельность -> Монтаж и ремонт оборудования"

  irr_multi_select "Тип предложения", "offer"
end

