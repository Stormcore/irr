# encoding: utf-8

class CategorySportsTourismFitnessBoxingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/fitness/boxing"
  @category = "Спорт, туризм, отдых -> Фитнесс, атлетика, борьба -> Бокс, товары для единоборств"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "type"
  irr_single_select "Тип снаряжения", "boxing_equip"
end
