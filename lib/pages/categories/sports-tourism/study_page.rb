# encoding: utf-8

class CategorySportsTourismStudyPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/study"
  @category = "Спорт, туризм, отдых -> Обучения и занятия"

  irr_multi_select "Тип предложения", "offer"

end
