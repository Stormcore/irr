# encoding: utf-8

class CategoryBeautyHealthLoseWeightPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/beauty-health/lose-weight"
  @category = "Здоровье и красота -> Похудение"

  irr_multi_select "Тип предложения", "offertype"
end
