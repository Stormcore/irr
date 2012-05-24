# encoding: utf-8

class CategoryCommunicationMobileMiniPBXPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/communication/office-and-home/mini-pbx/"
  @category = "Телефоны и связь -> Для дома и офиса -> Мини-АТС"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
