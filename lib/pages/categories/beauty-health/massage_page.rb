# encoding: utf-8

class CategoryBeautyHealthMassagePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/beauty-health/massage"
  @category = "Здоровье и красота -> Массаж"

  irr_multi_select "Тип предложения", "offertype"
end
