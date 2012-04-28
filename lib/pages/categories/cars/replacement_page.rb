# encoding: utf-8

class CarsRepaymentSearchPage
  include PageObject
  
  text_field :price_from, :name => "price[from]"
  text_field :price_to, :name => "price[to]"
  
  div :type, :xpath => "//div[@data-item-name='type']//div[@class='controlSelect']"
  div :condition, :xpath => "//div[@data-item-name='condition']//div[@class='controlSelect']"
  div :madein, :xpath => "//div[@data-item-name='madein']//div[@class='controlSelect']"
  
  link :run_search, :id => "show-result-search"
  
  #TODO: Переместить в общие для селекторов
  def multiselect(element, values)
    element.click
    values.split(",").each do |value|
      xpath = "//label[contains(.,'#{value.strip}')]/input"
      element.parent.checkbox_element(:xpath => xpath).check
    end
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
    end
  end
end