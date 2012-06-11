# encoding: utf-8

class CategoryAnimalsPlantsAccessoriesAnimalClothPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/animals-plants/accessories/animal_cloth"
  @category = "Животные и растения -> Аксессуары -> Одежда для животных"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Состояние", "used-or-new"
  irr_single_select "Вид животного", "type"

end
