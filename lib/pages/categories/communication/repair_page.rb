# encoding: utf-8

class CategoryCommunicationRepairPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/communication/repair/"
  @category = "Телефоны и связь -> Ремонт и сервис"

  irr_multi_select "Тип предложения", "offertype"
end
