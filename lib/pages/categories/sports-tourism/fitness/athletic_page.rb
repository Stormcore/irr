# encoding: utf-8

class CategorySportsTourismFitnessAthleticPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/fitness/athletic"
  @category = "Спорт, туризм, отдых -> Фитнесс, атлетика, борьба -> Атлетика и фитнес"

  irr_multi_select "Тип предложения", "offer"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Тип снаряжения", "fitness_equip"
end

