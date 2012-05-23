# encoding: utf-8

class CategoryElectronicsTechnicsGPSNavigatorsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/electronics-technics/gps-navigators"
  @category = "Электроника и техника -> GPS-навигаторы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип навигатора", "gps_type"

end
