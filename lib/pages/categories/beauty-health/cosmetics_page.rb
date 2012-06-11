# encoding: utf-8

class CategoryBeautyHealthCosmeticsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/beauty-health/cosmetics"
  @category = "Здоровье и красота -> Косметика"

  irr_multi_select "Тип предложения", "offertype"
end
