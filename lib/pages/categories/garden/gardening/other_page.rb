# encoding: utf-8

class CategoryGardenGardeningOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/gardening/other"
  @category = "Все для дачи -> Товары для садоводства -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
