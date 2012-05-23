# encoding: utf-8

class CategoryElectronicsTechnicsBookReaderPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/electronics-technics/bookreader"
  @category = "Электроника и техника -> Электронные книги"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_single_select "Тип дисплея", "bookreader_display_type"
  irr_range_select "Объем встроенной памяти", "memoty_bookreader"
  irr_checkbox     "Сенсорный экран", "bookreader_sens_display"
  irr_checkbox     "Встроенная подсветка", "built_lit"

end
