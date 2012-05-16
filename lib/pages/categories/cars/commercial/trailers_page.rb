# encoding: utf-8

class CategoryCarsCommercialTrailersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/commercial/trailers"

  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_range_select "Год выпуска", "car-year"
  irr_multi_select "Тип прицепа", "trailertype"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_text_field   "Число осей", "shafts"
  irr_range_select "Пробег", "mileage"
  irr_multi_select "Источник", "sourcefrom"

  def set_parameter (hash)
    if @@setter_functions.has_key?(hash['parameter'])
      self.send "#{@@setter_functions[hash['parameter']]}", hash
    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Пробег"
      # Пробег вводиться в тыс. км, отображается в км.
      # Делим отображаемый результат на 1000 
      result = self.send("#{@@getter_functions[field]}").to_i / 1000
    else
      if @@getter_functions.has_key?(field)
        result = self.send("#{@@getter_functions[field]}")
      else
        result = get_generic_parameter(field)
      end
    end
    result
  end
end
