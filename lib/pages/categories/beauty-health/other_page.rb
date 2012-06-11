# encoding: utf-8

class CategoryBeautyHealthOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/beauty-health/other"
  @category = "Здоровье и красота -> Другое"

  irr_multi_select "Тип предложения", "offertype"
end
