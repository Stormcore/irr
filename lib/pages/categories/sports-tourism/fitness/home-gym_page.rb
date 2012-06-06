# encoding: utf-8

class CategorySportsTourismFitnessHomeGymPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/fitness/home-gym"
  @category = "Спорт, туризм, отдых -> Фитнесс, атлетика, борьба -> Тренажеры, спорткомплексы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Тип тренажера", "home_gym_type"
end

