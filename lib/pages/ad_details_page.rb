# encoding: utf-8

class AdDetailsPage
  include PageObject
  
  # Настройка параметров
  link :expand_extended_more, :class => "expand_extended_more"
  text_field :keywords, :xpath => "//form[@id='filter']//input[@name='keywords']"
  text_field :price_from, :name => "price[from]"
  text_field :price_to, :name => "price[to]"
  div :currency, :xpath => "//div[@data-item-name='price']"
  checkbox :hasimages, :name => "hasimages"
  checkbox :hasvideo, :name => "isvideo"
  div :date_create, :xpath => "//div[@data-item-name='date_create']"
  div :source_from, :xpath => "//div[@data-item-name='sourcefrom']"
  link :run_search, :id => "show-result-search"
  
  # Показ параметров 
  link :show_all_params, :id => "showAllParamsLink"
  div :title, :xpath => "//div[@id='wrapTitle']/div[@name='wrapTitleLeft']"
  div :video, :class => "b-video"
  link :show_all_text, :class => "showAll"

  # Весь текст объявления
  div :advert_text, :class => "txtAdvert"
  table :all_params, :id => "allParams"
  div :ad_content, :xpath => "//div[@class='b-content']"
  
  # Все параметры
  def singleselect(element, value)
    element.div_element(:class => "controlSelectS").when_present.click
    element.element.div(:text => value.strip).when_present.click
  end

  def expand_all_parameters
    if self.expand_extended_more_element.visible?
      self.expand_extended_more
    end
  end

  def has_video?
    self.video_element.exists?
  end

  def show_all_parameters
    # Open all params if present
    self.show_all_params_element.when_present.click
  end

  def set_generic_parameter(hash)
    case hash['parameter']
    when "Цена"
      self.price_from = hash['min']
      self.price_to = hash['max']

    when "Ключевые слова"
      self.keywords = hash['value']

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
      puts "Неизвестный параметр: #{hash['parameter']}"
      raise "Unknown parameter"
    end
  end

  def get_generic_parameter(field)
    xpath = "//table[@id='mainParams']/tbody/tr[./th/span[text()='#{field}']]/td"
    self.cell_element(:xpath => xpath).when_present.text
  end

  def set_parameter (hash)
    if self.class.class_variable_get(:@@setter_functions).has_key?(hash['parameter'])
      self.send "#{self.class.class_variable_get(:@@setter_functions)[hash['parameter']]}", hash
    else
      set_generic_parameter(hash)
    end
  end
  
  def get_parameter (field)
    if self.class.class_variable_get(:@@getter_functions).has_key?(field)
      self.send("#{self.class.class_variable_get(:@@getter_functions)[field]}")
    else
      get_generic_parameter(field)
    end
  end

end
