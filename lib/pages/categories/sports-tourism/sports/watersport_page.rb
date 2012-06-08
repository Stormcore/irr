# encoding: utf-8

class CategorySportsTourismSportsWatersportsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/sports/watersport"
  @category = "Спорт, туризм, отдых -> Спортивные игры, виды спорта -> Водный спорт, дайвинг"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "type"
  irr_single_select "Тип снаряжения", "watersport_equip"
end

