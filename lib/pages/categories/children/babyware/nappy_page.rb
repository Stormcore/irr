# encoding: utf-8

class CategoryChildrenBabywareNappyPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/babyware/nappy/"
  @category = "Товары для детей -> Товары для малышей -> Подгузники, пеленки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
