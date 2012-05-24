# encoding: utf-8

class CategoryCommunicationMobileMobilePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/communication/mobile/mobiles/"
  @category = "Телефоны и связь -> Мобильная связь -> Мобильные телефоны"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка",  "make"
  irr_multi_select "Модель", "model"
  irr_single_select "Тип корпуса", "corpus_type"
  irr_checkbox     "Смартфон", "mobile_smartphone"
  irr_checkbox     "Поддержка 2 sim-карт", "mobile_two_sim_card"
  irr_checkbox_with_value "Гарантия", "guarantee"
end
