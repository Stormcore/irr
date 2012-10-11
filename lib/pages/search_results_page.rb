# encoding: utf-8
class SearchResultsPage
  include PageObject

  def set_list_type type
    if type == "Таблица"
      @@result_type_class = ResultTable
    else
      @@result_type_class = Result
    end
  end

  def switch_to_view type
    classs = nil
    case type
    when "Таблица"
      classs = "listico"
    when "Список"
      classs = "extlistico"
    end
    self.div_element(class: "ads_list").element.i(class: classs).parent.click
    self.set_list_type type
  end

  def set_filter_parameter hash
    if self.table_element.element.td(text: hash['поле']).exists?
      td = self.table_element.element.td(text: hash['поле'])
      raise "Поле '#{hash['поле']}' не найден" unless td.exists?
      control_td = td.td(xpath: 'following-sibling::*')

      is_region = control_td.a(id: 'regionsSelect').exists?
      is_select = control_td.div(class: "selector").exists?
      is_textbox = control_td.text_field.exists?

      if is_region
        control_td.a(id: 'regionsSelect').click
      end

      if is_select
        control_td.div(class: "selector").click
        select = control_td.select
        Watir::Wait.until {select.options.find{|o| o.text == hash['значение']}}
        select.select hash['значение']
      end

      if is_textbox and not is_region
        control_td.text_field.set hash['от']
        # Получаем ID первого текстбокса, из него сгенерим имя второго
        from_id = control_td.text_field.id
        to_id = from_id.gsub('from', 'to')
        self.table_element.element.text_field(id: to_id).set hash['до']
      end
    else
      #Чекбокс
      is_checkbox
    end
  end

  def do_search
    self.button_element(text:"Найти").click
  end

  def switch_to_page num
    puts "switch_to_page num"
  end

  def get_results_size
    self.div_element(class: "ads_list").div_elements(class: "ads_item").size
  end

  def get_results
    unless SearchResultsPage.class_variables.include? :@@result_type_class
      self.set_list_type("Список")
    end
    ads_list = self.div_element(class: "ads_list")
    ads_list.div_elements(class: "ads_item").each_with_index.map {|d, i|
        @@result_type_class.new ads_list, i-1
    }
  end

end

class Result
  def initialize table, i
    # Получаем элемент из ссылки и таблицы элементов, если он не существует
    begin
      @element.nil? and @element.exists?
    rescue Selenium::WebDriver::Error::StaleElementReferenceError, NoMethodError
      @element = table.div_element(class: "ads_item", index: i).element
    end
  end

  def get_url
    @element.a.href
  end

  def get_parameter key
    case key
    when "Город"
      @element.p(class: "city").text
    when "Цена"
      @element.p(class: "number").text.gsub(" ","")
    else
      raise "Неизвестное поле '#{key}'"
    end
  end

  def get_photo_url
    @element.p(class: "link").img.src rescue ""
  end
end

class ResultTable < Result
  def get_parameter key
    case key
    when "Год выпуска"
      @element.td(class: "year").text
    when "Пробег"
      @element.td(class: "mileage").text
    else
      raise "Неизвестное поле '#{key}'"
    end
  end
end
