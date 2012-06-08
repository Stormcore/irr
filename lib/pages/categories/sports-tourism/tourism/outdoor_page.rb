# encoding: utf-8

class CategorySportsTourismTourismOutdoorPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/tourism/outdoor"
  @category = "Спорт, туризм, отдых -> Снаряжение для рыбалки, охоты, активного отдыха -> Туризм"

  irr_multi_select "Тип предложения", "offer"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Тип снаряжения ", "fishing_equip"
end

