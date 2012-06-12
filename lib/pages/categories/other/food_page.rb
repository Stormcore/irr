# encoding: utf-8

class CategoryOtherFoodPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/other/food"
  @category = "Другое -> Продовольствие"

  irr_multi_select "Тип предложения", "offertype"
end
