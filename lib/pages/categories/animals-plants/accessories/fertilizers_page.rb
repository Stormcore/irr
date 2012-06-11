# encoding: utf-8

class CategoryAnimalsPlantsAccessoriesFertilizersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/animals-plants/accessories/fertilizers"
  @category = "Животные и растения -> Аксессуары -> Удобрения"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Состояние", "used-or-new"

end
