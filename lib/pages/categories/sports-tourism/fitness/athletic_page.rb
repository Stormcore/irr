# encoding: utf-8

class CategorySportsTourismFitnessAthleticPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/fitness/athletic"
  @category = "Спорт, туризм, отдых -> Фитнес, атлетика, борьба -> Атлетика и фитнес"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "type"
  irr_single_select "Тип снаряжения", "fitness_equip"
end

