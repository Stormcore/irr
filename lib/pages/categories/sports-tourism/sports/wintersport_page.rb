# encoding: utf-8

class CategorySportsTourismSportsWintersportsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/sports/wintersport"
  @category = "Спорт, туризм, отдых -> Спортивные игры, виды спорта -> Зимний инвентарь"

  irr_multi_select "Тип предложения", "offer"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Тип снаряжения", "wintersport_equip"
end

