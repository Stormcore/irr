# encoding: utf-8

class CategoryCarsPassangerPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/passenger"
  @category = "Авто и мото -> Легковые автомобили"

  irr_range_select "Год выпуска", "car-year"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_multi_select "Тип кузова", "bodytype"
  irr_multi_select "Тип двигателя", "turbo"
  irr_multi_select "Тип привода", "gear"
  irr_multi_select "Тип трансмиссии", "transmittion"
  irr_range_select "Пробег", "mileage"

  def get_parameter (field)
    case field
    when "Год выпуска"
      # Вырезаем г.
      super(field).gsub(/ г./, '')
    else
      super(field)
    end
  end
end
