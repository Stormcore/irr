# encoding: utf-8

class CategoryCommunicationMobileFaxedPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/communication/office-and-home/faxes/"
  @category = "Телефоны и связь -> Для дома и офиса -> Факсы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
