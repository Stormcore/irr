# encoding: utf-8

class CategorySportsTourismTourismFishingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/tourism/fishing"
  @category = "Спорт, туризм, отдых -> Снаряжение для рыбалки, охоты, активного отдыха -> Рыбалка"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Тип снаряжения ", "fishing_equip"
end

