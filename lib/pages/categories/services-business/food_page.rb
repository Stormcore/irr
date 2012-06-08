# encoding: utf-8

class CategoryServicesBusinessFoodPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/food"
  @category = "Услуги и деятельность -> Питание, обеды с доставкой"

  irr_multi_select "Тип предложения", "offer"
end

