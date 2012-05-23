# encoding: utf-8

class CategoryElectronicsTechnicsRepairPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/electronics-technics/repair"
  @category = "Электроника и техника -> Ремонт и сервис"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
