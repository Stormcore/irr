# encoding: utf-8

class CategoryAnimalsPlantsAccessoriesOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/animals-plants/accessories/other"
  @category = "Животные и растения -> Аксессуары -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"

end
