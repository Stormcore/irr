# encoding: utf-8

class CategorySportsTourismBicyclesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/bicycles"
  @category = "Спорт, туризм, отдых -> Велосипеды"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Тип товара", "type"
  irr_single_select "Производитель", "make"
  irr_single_select "Тип велосипеда", "biketype"
  irr_range_select "Вес", "weight_bike"

  def get_parameter(field)
    if field == "Вес"
      super(field).gsub(/ кг/,'')
    else
      super(field)
    end
  end
end
