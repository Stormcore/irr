# encoding: utf-8

class CategoryBeautyHealthCosmetologyPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/beauty-health/cosmetology"
  @category = "Здоровье и красота -> Косметология и коррекция"

  irr_multi_select "Тип предложения", "offertype"
end
