# encoding: utf-8

class CategoryCommunicationOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/communication/other/"
  @category = "Телефоны и связь -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
