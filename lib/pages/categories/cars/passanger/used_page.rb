# encoding: utf-8

class CategoryCarsPassangerUsedPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/passenger/used"

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
      return self.send("#{@@getter_functions[field]}").gsub(/ г./, '')
    when "Пробег"
      # Пробег вводиться в тыс. км, отображается в км.
      # Делим отображаемый результат на 1000 
      return self.send("#{@@getter_functions[field]}").to_i / 1000
    else
      super(field)
    end
  end
end
