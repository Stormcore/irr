# encoding: utf-8

class CategoryAnimalsPlantsAccessoriesFoodPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/animals-plants/accessories/food"
  @category = "Животные и растения -> Аксессуары -> Корма и добавки"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Тип животного", "type", "Вид животного"

end
