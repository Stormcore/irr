# encoding: utf-8

class CategoryCarsPassangerNewPage < AdDetailsPage
  include PageObject
  
  text_field :car_year_from, :name => "car-year[from]"
  text_field :car_year_to, :name => "car-year[to]"

  div :make, :xpath => "//div[@data-item-name='make']"
  div :model, :xpath => "//div[@data-item-name='model']"

  div :bodytype, :xpath => "//div[@data-item-name='bodytype']"
  div :turbo, :xpath => "//div[@data-item-name='turbo']"
  div :gear, :xpath => "//div[@data-item-name='gear']"
  div :transmittion, :xpath => "//div[@data-item-name='transmittion']"
  
  def set_parameter (hash)
    case hash['parameter']
    #TODO: Переместить в общие
    when "Цена"
      self.price_from = hash['min']
      self.price_to = hash['max']
    #TODO: Переместить в общие
    when "Валюта"
      singleselect(self.currency_element, hash['value'])

    when "Год выпуска"
      self.car_year_from = hash['min']
      self.car_year_to = hash['max']

    when "Марка"
      multiselect(self.make_element, hash['value'])

    when "Модель"
      multiselect(self.model_element, hash['value'])
      
    when "Тип кузова"
      multiselect(self.bodytype_element, hash['value'])
    
    when "Тип двигателя"
      multiselect(self.turbo_element, hash['value'])
      
    when "Тип привода"
      multiselect(self.gear_element, hash['value'])
      
    when "Тип трансмиссии"
      multiselect(self.transmittion_element, hash['value'])
      
    when "Пробег"
      self.mileage_from = hash['min']
      self.mileage_to = hash['max']

    when "С фото"
      self.hasimages_element.click

    when "С видео"
      self.hasvideo_element.click

    when "Источник"
      singleselect(self.source_from_element, hash['value'])  

    when "Поданные"
      singleselect(self.date_create_element, hash['value'])

    else
      raise "Неизвестный параметр: #{hash['parameter']}"
    end
  end
  
  def get_parameter (field)
    case field
    when "Год выпуска"
      result = get_value_parameter(field)
    when "Марка", "Модель", "Тип кузова", "Тип двигателя", "Привод", "Тип трансмиссии"
      result = get_unique_parameter(field)
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end