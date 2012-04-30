# encoding: utf-8

class CategoryCarsMiscOtherPage < AdDetailsPage
  include PageObject

  link :expand_extended_more, :class => "expand_extended_more"
  
  #TODO: Переместить в общие
  text_field :price_from, :name => "price[from]"
  text_field :price_to, :name => "price[to]"
  div :currency, :xpath => "//div[@data-item-name='price']"

  #TODO: Переместить в общие
  checkbox :hasimages, :name => "hasimages"
  checkbox :hasvideo, :name => "isvideo"
  
  div :date_create, :xpath => "//div[@data-item-name='date_create']"
  div :source_from, :xpath => "//div[@data-item-name='sourcefrom']"
  
  link :run_search, :id => "show-result-search"
  
  #TODO: Переместить в общие для селекторов
  def multiselect(element, values)
    element.div_element(:class => "controlSelect").click
    values.split(",").each do |value|
      xpath = "//label[contains(.,'#{value.strip}')]/input"
      element.parent.checkbox_element(:xpath => xpath).check
    end
    element.div_element(:class => "controlSelect").click
  end
  
  #TODO: Переместить в общие для селекторов
  def singleselect(element, value)
    element.div_element(:class => "controlSelectS").click
    element.parent.div(:text => value.strip).click
  end
  
  #TODO: Переместить в общие
  def expand_all_parameters
    if self.expand_extended_more_element.exists?
      self.expand_extended_more
    end
  end
  
  def set_parameter (hash)
    case hash['parameter']

    #TODO: Переместить в общие
    when "Цена"
      self.price_from = hash['min']
      self.price_to = hash['max']
    #TODO: Переместить в общие
    when "Валюта"
      singleselect(self.currency_element, hash['value'])

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
    get_generic_parameter(field) 
  end
end