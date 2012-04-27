# encoding: utf-8

class CarsRepaymentSearchPage
  include PageObject
  
  text_field :price_from, :name => "price[from]"
  text_field :price_to, :name => "price[to]"
  
  div :type, :xpath => "//div[@data-item-name='type']//div[@class='controlSelect']"
  
  link :run_search, :id => "show-result-search"
  
  def set_parameter (hash)
    case hash['parameter']
      
    when "Цена"
      self.price_from = hash['min']
      self.price_to = hash['max']
        
    when "Тип автомобиля"
      # Expand the combobox
      self.type_element.click
      hash['value'].split(",").each do |value|
        xpath = "//label[contains(.,'#{value.strip}')]/input"
        self.type_element.parent.checkbox_element(:xpath => xpath).check
      end
      
    end
  end
end