# encoding: utf-8

class CategoryCommunicationAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/communication/accessories/"
  @category = "Телефоны и связь -> Аксессуары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Тип аксессуара", "mobileaccess_type"
end
