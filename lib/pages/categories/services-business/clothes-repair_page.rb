# encoding: utf-8

class CategoryServicesBusinessClothesRepairPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/clothes-repair"
  @category = "Услуги и деятельность -> Ремонт и изготовление одежды и обуви"

  irr_multi_select "Тип предложения", "offer"
end

