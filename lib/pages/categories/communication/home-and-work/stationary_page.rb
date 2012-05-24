# encoding: utf-8

class CategoryCommunicationMobileStationaryPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/communication/office-and-home/stationary/"
  @category = "Телефоны и связь -> Для дома и офиса -> Стационарные телефоны"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
