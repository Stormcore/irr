# encoding: utf-8

class CategoryCarsPartsTiresPage < AdDetailsPage
  include PageObject
  @@getter_functions = Hash.new
  @@setter_functions = Hash.new
  @@url_suffix = "/cars/parts/tires"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "condition_c"
  irr_multi_select "Тип автомобиля", "cartype"
  irr_multi_select "Сезонность", "seasonality"
  irr_multi_select "Производитель", "producer"
  irr_multi_select "Диаметр", "diameter"
  irr_multi_select "Ширина профиля", "profile_width"
  irr_multi_select "Высота профиля", "profile_height"

  def set_parameter (hash)
    if @@setter_functions.has_key?(hash['parameter'])
      self.send "#{@@setter_functions[hash['parameter']]}", hash
    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Диаметр обода", "Диаметр"
      # Вырезаем дюймы
      result = self.send("#{@@getter_functions[field]}").gsub(/ "/, '')

    when "Ширина профиля"
      # Вырезаем миллиметры
      result = self.send("#{@@getter_functions[field]}").gsub(/ мм/, '')

    when "Высота профиля"
      # Вырезаем проценты
      result = self.send("#{@@getter_functions[field]}").gsub(/ %/, '')

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
