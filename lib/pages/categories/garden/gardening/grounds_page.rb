# encoding: utf-8

class CategoryGardenGardeningGroundsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/gardening/grounds"
  @category = "Все для дачи -> Товары для садоводства -> Грунт, удобрения"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
