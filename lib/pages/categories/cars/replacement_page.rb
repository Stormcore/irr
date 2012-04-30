# encoding: utf-8

class CategoryCarsRepaymentSearchPage < AdDetailsPage
  include PageObject
  
  div :type, :xpath => "//div[@data-item-name='type']"
  div :condition, :xpath => "//div[@data-item-name='condition']"
  div :madein, :xpath => "//div[@data-item-name='madein']"
  
  def set_parameter (hash)
    case hash['parameter']
      
    when "Цена"
      self.price_from = hash['min']
      self.price_to = hash['max']
        
    when "Валюта"
      singleselect(self.currency_element, hash['value'])
        
    when "Тип автомобиля"
      multiselect(self.type_element, hash['value'])
    
    when "Состояние"
      multiselect(self.condition_element, hash['value'])
        
    when "Автомобили"
      multiselect(self.madein_element, hash['value'])
        
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

  def get_parameter(field)
    get_generic_parameter(field)
  end
end