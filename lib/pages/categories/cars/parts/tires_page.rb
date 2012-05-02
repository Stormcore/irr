# encoding: utf-8

class CategoryCarsPartsTiresPage < AdDetailsPage
  include PageObject
  div :offertype, :xpath => "//div[@data-item-name='offertype']"
  div :condition_c, :xpath => "//div[@data-item-name='condition_c']"
  div :cartype, :xpath => "//div[@data-item-name='cartype']"
  div :seasonality, :xpath => "//div[@data-item-name='seasonality']"
  div :producer, :xpath => "//div[@data-item-name='producer']"
  div :diameter, :xpath => "//div[@data-item-name='diameter']"
  div :profile_width, :xpath => "//div[@data-item-name='profile_width']"
  div :profile_height, :xpath => "//div[@data-item-name='profile_height']"

  def set_parameter (hash)
    case hash['parameter']

    when "Тип предложения"
      multiselect(self.offertype_element, hash['value'])

    when "Состояние"
      multiselect(self.condition_c_element, hash['value'])
      
    when "Тип автомобиля"
      multiselect(self.cartype_element, hash['value'])
      
    when "Сезонность"
      multiselect(self.seasonality_element, hash['value'])
      
    when "Производитель"
      multiselect(self.producer_element, hash['value'])
      
    when "Диаметр"
      multiselect(self.diameter_element, hash['value'])
      
    when "Ширина профиля"
      multiselect(self.profile_width_element, hash['value'])
      
    when "Высота профиля"
      multiselect(self.profile_height_element, hash['value'])

    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    result = get_generic_parameter(field) 
  end
end