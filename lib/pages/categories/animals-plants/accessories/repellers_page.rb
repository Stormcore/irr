# encoding: utf-8

class CategoryAnimalsPlantsAccessoriesRepellentsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/animals-plants/accessories/repellents"
  @category = "Животные и растения -> Аксессуары -> Средства отпугивания и самообороны"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Состояние", "used-or-new"

end
