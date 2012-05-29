# encoding: utf-8

class CategoryChildrenBabywarebabyCarrierPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/babyware/baby-carrier/"
  @category = "Товары для детей -> Товары для малышей -> Рюкзаки, слинги, переноски"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
