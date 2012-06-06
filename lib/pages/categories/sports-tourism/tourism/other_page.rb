# encoding: utf-8

class CategorySportsTourismTourismOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/tourism/other"
  @category = "Спорт, туризм, отдых -> Снаряжение для рыбалки, охоты, активного отдыха -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

