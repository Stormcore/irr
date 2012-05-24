# encoding: utf-8

class CategoryCommunicationMobileContractsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/communication/mobile/contracts/"
  @category = "елефоны и связь -> Мобильная связь -> Контракты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Оператор связи",  "operator"
  irr_text_field   "Название тарифа", "tarif"
end
