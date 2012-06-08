# encoding: utf-8

class CategorySportsTourismTravelPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/travel"
  @category = "Спорт, туризм, отдых -> Экскурсии, туры, круизы"

  irr_multi_select "Тип предложения", "offer"
  irr_single_select "Вид отдыха", "vacation_type"

end
