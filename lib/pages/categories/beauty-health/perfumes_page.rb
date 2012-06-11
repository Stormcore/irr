# encoding: utf-8

class CategoryBeautyHealthPerfumesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/beauty-health/perfumes"
  @category = "Здоровье и красота -> Парфюмерия"

  irr_multi_select "Тип предложения", "offertype"
end
