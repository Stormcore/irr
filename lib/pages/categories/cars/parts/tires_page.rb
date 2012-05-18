# encoding: utf-8

class CategoryCarsPartsTiresPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/tires"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "condition_c"
  irr_multi_select "Тип автомобиля", "cartype"
  irr_multi_select "Сезонность", "seasonality"
  irr_multi_select "Производитель", "producer"
  irr_multi_select "Диаметр", "diameter"
  irr_multi_select "Ширина профиля", "profile_width"
  irr_multi_select "Высота профиля", "profile_height"

  def get_parameter (field)
    case field
    when "Диаметр обода", "Диаметр"
      # Вырезаем дюймы
      result = self.send(self.class.instance_variable_get(:@getter_functions)[field])
      return result.gsub(/ "/, '')

    when "Ширина профиля"
      # Вырезаем миллиметры
      result = self.send(self.class.instance_variable_get(:@getter_functions)[field])
      return result.gsub(/ мм/, '')

    when "Высота профиля"
      # Вырезаем проценты
      result = self.send(self.class.instance_variable_get(:@getter_functions)[field])
      return result.gsub(/ %/, '')

    else
      super(field)
    end 
  end
end
