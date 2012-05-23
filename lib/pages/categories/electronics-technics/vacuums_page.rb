# encoding: utf-8

class CategoryElectronicsTechnicsVacuumPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/electronics-technics/vacuum"
  @category = "Электроника и техника -> Пылесосы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_checkbox     "Моющие", "vacuumclean_wash"

end
