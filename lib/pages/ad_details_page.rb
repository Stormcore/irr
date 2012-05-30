# encoding: utf-8

class AdDetailsPage
  include PageObject
  #Dir["#{File.dirname(__FILE__)}/../../../control/**/*_control.rb"].each {|r| load r }
  
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
  div :ad_content, :class => "b-content"
  
  # Все параметры
  def singleselect(element, value)
    begin
      element.div_element(:class => "controlSelectS").when_present.click
      element.element.div(:text => value.strip).when_present.click
    rescue Watir::Exception::UnknownObjectException => e
      puts "ERROR: #{e.message}"
      raise "Отсутствует значение '#{value.strip}'"
    end
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
    self.show_all_params if self.show_all_params_element.visible?
  end

  def set_generic_parameter(hash)
    case hash['parameter']
    when "Цена"
      begin
        self.price_from = hash['min']
        self.price_to = hash['max']
      rescue Watir::Exception::UnknownObjectException => e
        puts "ERROR: #{e.message}"
        raise "Отсутствует поле Цена"
      end

    when "Ключевые слова"
      begin
        self.keywords = hash['value']
      rescue Watir::Exception::UnknownObjectException => e
        puts "ERROR: #{e.message}"
        raise "Отсутствует поле Ключевые слова"
      end

    when "Валюта"
      singleselect(self.currency_element, hash['value'])

    when "С фото"
      begin
        self.hasimages_element.click
      rescue Watir::Exception::UnknownObjectException => e
        puts "ERROR: #{e.message}"
        raise "Отсутствует поле 'С фото'"
      end
      
    when "С видео"
      begin
        self.hasvideo_element.click
      rescue Watir::Exception::UnknownObjectException => e
        puts "ERROR: #{e.message}"
        raise "Отсутствует поле 'С видео'"
      end
      
    when "Источник"
      singleselect(self.source_from_element, hash['value'])
      
    when "Поданные"
      singleselect(self.date_create_element, hash['value'])
 
    else
      raise "Неизвестный параметр: #{hash['parameter']}"
    end
  end

  def get_generic_parameter(field)
    xpath = "//table[@id='mainParams']/tbody/tr[./th/span[text()='#{field}']]/td"
    begin
      self.cell_element(:xpath => xpath).when_present.text
    rescue Watir::Wait::TimeoutError => exception
      raise "Параметр '#{getter_name}' не найден"
    end
  end

  def set_parameter (hash)
    case hash['parameter']
    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      self.set_metro_parameter(hash)
    when "Расположение", "Направление", "Шоссе", "Удаленность"
      self.set_regions_parameter(hash)
    when "Валюта", "Срок сдачи"
      if self.respond_to? :set_rent_parameter
        self.set_rent_parameter(hash)
      else
        set_generic_parameter(hash)
      end
    else
      setter_functions = self.class.instance_variable_get(:@setter_functions)
      if setter_functions and setter_functions.has_key? hash['parameter']
        self.send "#{setter_functions[hash['parameter']]}", hash
      else
        set_generic_parameter(hash)
      end    
    end
  end
  
  def get_parameter (field)
    case field
    when "АО", "Район города", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      self.get_metro_parameter(field) 
    when "Регион", "Направление", "Шоссе", "Удаленность"
      self.get_regions_parameter(field)
    else
      getter_functions = self.class.instance_variable_get(:@getter_functions)
      if getter_functions and getter_functions.has_key? field
        self.send "#{getter_functions[field]}"
      else
        get_generic_parameter(field)
      end
    end
  end

end
