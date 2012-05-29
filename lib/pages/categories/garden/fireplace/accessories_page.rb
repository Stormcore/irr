# encoding: utf-8

class CategoryGardenFireplaceAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/fireplace/accessories"
  @category = "Все для дачи -> Камины, печи -> Аксессуары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
