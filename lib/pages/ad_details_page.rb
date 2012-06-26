# encoding: utf-8

#TODO: REFACTOR MEEEE!


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
  div :photo, :class => "b-photo"
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
      Watir::Wait.until { element.div_element(:class => "selectItemsPopup").style('display') == "block" }
      element.element.div(:text => value.strip).when_present.click
    rescue Exception => e
      raise "Отсутствует значение '#{value.strip}'\n#{e}"
    end
  end

  def expand_all_parameters
    if self.expand_extended_more_element.visible?
      self.expand_extended_more
    end
  end

  def get_photo
    self.photo_element.when_present.image_element.element.attribute("src")
  end

  def has_video?
    self.video_element.exists?
  end

  def show_all_parameters
    # Open all params if present
    self.show_all_params if self.show_all_params_element.when_present(10).exists?
  end

  def set_generic_parameter(hash)
    case hash['parameter']
    when "Цена", "Зарплата"
      begin
        self.price_from = hash['min'] if hash.has_key?('min')
        self.price_to = hash['max'] if hash.has_key?('max')
      rescue Exception => e
        raise "Отсутствует поле Цена\n#{e}"
      end

    when "Ключевые слова"
      begin
        self.keywords = hash['value']
      rescue Exception => e
        raise "Отсутствует поле Ключевые слов\n#{e}"
      end

    when "Валюта"
      singleselect(self.currency_element, hash['value'])

    when "С фото"
      begin
        self.hasimages_element.click
      rescue Exception => e
        raise "Отсутствует поле 'С фото'\n#{e}"
      end

    when "С видео"
      begin
        self.hasvideo_element.click
      rescue Exception => e
        raise "Отсутствует поле 'С видео'\n#{e}"
      end

    when "Источник"
      singleselect(self.source_from_element, hash['value'])

    when "Поданные"
      singleselect(self.date_create_element, hash['value'])

    else
      raise "Неизвестный параметр: #{hash['parameter']}"
    end
  end

  def get_selected_generic_parameter(field, hash = nil)
    case field
    when "Цена", "Зарплата"
      begin
        result = {"min" => self.price_from, "max" => self.price_to}
      rescue Exception => e
        raise "Отсутствует поле Цена\n#{e}"
      end

    when "Ключевые слова"
      begin
        result = self.keywords
      rescue Exception => e
        raise "Отсутствует поле Ключевые слов\n#{e}"
      end

    when "Валюта"
      self.currency_element.div_element(:class => "controlSelectS").when_present.click
      Watir::Wait.until { element.div_element(:class => "selectItemsPopup").style('display') == "block" }
      result = self.currency_element.element.div(:text => hash['value'].strip).attribute("class") == "act"
    else
      raise "Неизвестный параметр: #{field}"
    end
    result
  end

  def get_generic_parameter(field)
    xpath = "//table[@id='mainParams']/tbody/tr[./th/span[text()='#{field}']]/td"
    begin
      self.cell_element(:xpath => xpath).when_present.text
    rescue Exception => e
      raise "Параметр '#{field}' не найден\n#{e}"
    end
  end

  def set_parameter (hash)
    case hash['parameter']
    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      # На случай совпадения имён, проверяем существует ли такая функция
      if self.respond_to?(:set_metro_parameter)
        self.set_metro_parameter(hash)
      else
        set_custom_parameter(hash)
      end
    when "Расположение", "Направление", "Шоссе", "Удаленность"
      if self.respond_to?(:set_regions_parameter)
        self.set_regions_parameter(hash)
      else
        set_custom_parameter(hash)
      end
    when "Валюта", "Срок сдачи"
      if self.respond_to? :set_rent_parameter
        self.set_rent_parameter(hash)
      else
        set_custom_parameter(hash)
      end
    else
      set_custom_parameter(hash)
    end
  end

  def get_selected_parameter (field, hash = nil)
    case field
    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      # На случай совпадения имён, проверяем существует ли такая функция
      if self.respond_to?(:get_selected_metro_parameter)
        self.get_selected_metro_parameter(field, hash)
      else
        get_selected_custom_parameter(field, hash)
      end
    when "Расположение", "Направление", "Шоссе", "Удаленность"
      if self.respond_to?(:get_selected_regions_parameter)
        self.get_selected_regions_parameter(field, hash)
      else
        get_selected_custom_parameter(field, hash)
      end
    when "Валюта", "Срок сдачи"
      if self.respond_to? :get_selected_rent_parameter
        self.get_selected_rent_parameter(field, hash)
      else
        get_selected_custom_parameter(field, hash)
      end
    else
      get_selected_custom_parameter(field, hash)
    end
  end

  def get_selected_custom_parameter(field, hash = nil)
    selectors_functions = self.class.instance_variable_get(:@selectors_functions)
    if selectors_functions and selectors_functions.has_key? field
      self.send "#{selectors_functions[field]}", hash
    else
      get_selected_generic_parameter(field, hash)
    end
  end

  def set_custom_parameter(hash)
    setter_functions = self.class.instance_variable_get(:@setter_functions)
    if setter_functions and setter_functions.has_key? hash['parameter']
      self.send "#{setter_functions[hash['parameter']]}", hash
    else
      set_generic_parameter(hash)
    end
  end

  def get_custom_parameter(field)
    getter_functions = self.class.instance_variable_get(:@getter_functions)
    if getter_functions and getter_functions.has_key? field
      self.send "#{getter_functions[field]}"
    else
      get_generic_parameter(field)
    end
  end

  def get_parameter (field)
    case field
    when "АО", "Район города", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      if self.respond_to? :get_metro_parameter
        self.get_metro_parameter(field)
      else
        get_custom_parameter(field)
      end
    when "Регион", "Направление", "Шоссе", "Удаленность"
      if self.respond_to? :get_regions_parameter
        self.get_regions_parameter(field)
      else
        get_custom_parameter(field)
      end
    else
      get_custom_parameter(field)
    end
  end

  def has_seo_link_section?
    begin
      self.div_element(:class => "quicklySearch").
        when_present.exists?
    rescue Watir::Wait::TimeoutError => e
      return false
    end
  end

  def select_link_with_text_from_quick_search_section(link)
    begin
      self.div_element(:class => "quicklySearch").
        when_present.link_element(:text => link).click
    rescue Watir::Exception::UnknownObjectException => e
      raise "Отсутствует seo-линк #{link}"
    end
  end

  def get_active_tab
    self.div_element(:class => "wrBookmarks").
      when_present.list_item_element(:class => "act").text
  end

  def map_displayed
    self.div_element(:class => "YMaps-layer-container").when_present.exists?
  end

end
