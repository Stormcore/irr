# encoding: utf-8

class CategorySportsTourismTourismOutdoorPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/tourism/outdoor"
  @category = "Спорт, туризм, отдых -> Снаряжение для рыбалки, охоты, активного отдыха -> Туризм"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "type"
  irr_single_select "Тип снаряжения", "fishing_equip"
end

