# encoding: utf-8

class CategoryCarsPartsWheelsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/wheels"
  @category = "Авто и мото -> Автозапчасти и принадлежности -> Колеса"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "condition_c"

end
