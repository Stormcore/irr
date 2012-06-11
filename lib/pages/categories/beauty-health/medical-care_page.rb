# encoding: utf-8

class CategoryBeautyHealthMedicalCarePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/beauty-health/medical-care"
  @category = "Здоровье и красота -> Медицинская помощь"

  irr_multi_select "Тип предложения", "offertype"
end
