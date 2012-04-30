# encoding: utf-8

class AdDetailsPage
  include PageObject

  # Настройка параметров
  link :expand_extended_more, :class => "expand_extended_more"
  text_field :keywords, :name => "keywords"
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

  
  def multiselect(element, values)
    element.div_element(:class => "controlSelect").click
    values.split(",").each do |value|
      xpath = "//label[text() = '#{value.strip}']/input"
      element.parent.checkbox_element(:xpath => xpath).check
    end
    element.div_element(:class => "controlSelect").click
  end
  
  def singleselect(element, value)
    element.div_element(:class => "controlSelectS").click
    element.parent.div(:text => value.strip).click
  end
  
  def expand_all_parameters
    if self.expand_extended_more_element.exists?
      self.expand_extended_more
    end
  end

  def has_video?
    self.video_element.exists?
  end

  def show_all_parameters
    # Open all params if present
    if self.show_all_params_element.visible?
      self.show_all_params
    end
  end

  def set_parameter(hash)
    case hash['parameter']
    when "Цена"
      self.price_from = hash['min']
      self.price_to = hash['max']

    when "Ключевое слово"
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
      raise "Неизвестный параметр: #{hash['parameter']}"
    end
  end

  def get_generic_parameter(field)
    self.show_all_parameters
    case field
    when "Заголовок"
      result = self.title_element.when_present.text
    else
      # Custom field
      xpath = "//tr[contains(.,'#{field}')]/td"
      result = self.cell_element(:xpath => xpath).when_present.text
    end
    result
  end
  
  def get_value_parameter(field)
    self.show_all_parameters
    xpath = "//tr[contains(.,'#{field}')]/td/span[@class='value']"
    self.span_element(:xpath => xpath).when_present.text
  end
  
  def get_unique_parameter(field)
    self.show_all_parameters
    xpath = "//tr[contains(.,'#{field}')]/td"
    self.cell_element(:xpath => xpath, :index => 1).when_present.text
  end
end
