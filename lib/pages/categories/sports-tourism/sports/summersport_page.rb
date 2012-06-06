# encoding: utf-8

class CategorySportsTourismSportsSummersportsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/sports/summersport"
  @category = "Спорт, туризм, отдых -> Спортивные игры, виды спорта -> Летний инвентарь"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Тип снаряжения", "summersport_equip"
end

