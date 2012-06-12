# encoding: utf-8

class CategoryAnimalsPlantsAccessoriesCarePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/animals-plants/accessories/care"
  @category = "Животные и растения -> Аксессуары -> Средства для ухода за животными"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"

end
