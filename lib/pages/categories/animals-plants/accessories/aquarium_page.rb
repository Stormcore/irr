# encoding: utf-8

class CategoryAnimalsPlantsAccessoriesAquariumPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/animals-plants/accessories/aquarium"
  @category = "Животные и растения -> Аксессуары -> Аквариумистика"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Состояние", "used-or-new"

end
