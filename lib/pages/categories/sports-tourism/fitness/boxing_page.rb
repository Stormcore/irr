# encoding: utf-8

class CategorySportsTourismFitnessBoxingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/fitness/boxing"
  @category = "Спорт, туризм, отдых -> Фитнесс, атлетика, борьба -> Бокс, товары для единоборств"

  irr_multi_select "Тип предложения", "offer"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Тип снаряжения", "boxing_equip"
end
