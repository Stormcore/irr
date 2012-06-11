# encoding: utf-8

class CategoryAnimalsPlantsPlantsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/animals-plants/plants"
  @category = "Животные и растения -> Растения"

  irr_multi_select "Тип предложения", "offertype"

end
