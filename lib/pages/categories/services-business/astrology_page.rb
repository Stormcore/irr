# encoding: utf-8

class CategoryServicesBusinessAstrologyPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/astrology"
  @category = "Услуги и деятельность -> Астрология, магия, гадания"

  irr_multi_select "Тип предложения", "offer"
end

