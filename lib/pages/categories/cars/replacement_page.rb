# encoding: utf-8

class CarsRepaymentSearchPage
  include PageObject
  
  text_field :price_from, :name => "price[from]"
  text_field :price_to, :name => "price[to]"
  
  div :type, :xpath => "//div[@data-item-name='type']"
  div :condition, :xpath => "//div[@data-item-name='condition']"
  div :madein, :xpath => "//div[@data-item-name='madein']"
  div :date_create, :xpath => "//div[@data-item-name='date_create']"
  
  checkbox :hasimages, :name => "hasimages"
  checkbox :hasvideo, :name => "hasvideo"
  
  link :run_search, :id => "show-result-search"
  
  #TODO: Переместить в общие для селекторов
  def multiselect(element, values)
    element.div_element(:class => "controlSelect").click
    values.split(",").each do |value|
      xpath = "//label[contains(.,'#{value.strip}')]/input"
      element.parent.checkbox_element(:xpath => xpath).check
    end
  end
  
  def singleselect(element, value)
    element.div_element(:class => "controlSelectS").click
    element.parent.div(:text => value.strip).click
  end
  
  def set_parameter (hash)
    case hash['parameter']
      
    when "Цена"
      self.price_from = hash['min']
      self.price_to = hash['max']
        
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
      
    when "Поданные"
      singleselect(self.date_create_element, hash['value'])
      
    else
      raise "Неизвестный параметр: #{hash['parameter']}"
    end
  end
end