# encoding: utf-8

class CategoryCommunicationMobileOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/communication/mobile/other/"
  @category = "Телефоны и связь -> Мобильная связь -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
