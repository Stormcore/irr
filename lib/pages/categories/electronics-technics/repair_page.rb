# encoding: utf-8

class CategoryElectronicsTechnicsRepairPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/electronics-technics/repair"
  @category = "Электроника и техника -> Ремонт"

  irr_multi_select "Тип предложения", "offertype"
end
