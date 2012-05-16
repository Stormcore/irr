# encoding: utf-8

class CategoryCarsCommercialTruckPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/commercial/trucks"

  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_range_select "Год выпуска", "car-year"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_multi_select "Тип кузова", "bodytype"
  irr_multi_select "Тип трансмиссии", "transmittion"
  irr_range_select "Пробег", "mileage"
  irr_multi_select "Источник", "sourcefrom"


  def get_parameter (field)
    case field
    when "Пробег"
      return self.send("#{@@getter_functions[field]}").to_i / 1000
    else 
      super(field)
    end
  end
end
