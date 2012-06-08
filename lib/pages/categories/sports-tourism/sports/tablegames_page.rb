# encoding: utf-8

class CategorySportsTourismSportsTablegamesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/sports/table-games"
  @category = "Спорт, туризм, отдых -> Спортивные игры, виды спорта -> Настольные игры"

  irr_multi_select "Тип предложения", "offer"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "table_games"
end

