# encoding: utf-8
class SearchResultsPageCompanies < SearchResultsPage
  include PageObject

  def get_results
    ads_list = self.div_element(class: "content")
    ads_list.div_elements(class: "dealerBlock").each_with_index.map {|d, i|
        Dealer.new ads_list, i-1
    }
  end

  def get_results_size
    self.div_element(class: "content").div_elements(class: "dealerBlock").size
  end

end

class Dealer
  def initialize table, i
    # Получаем элемент из ссылки и таблицы элементов, если он не существует
    begin
      @element.nil? and @element.exists?
    rescue Selenium::WebDriver::Error::StaleElementReferenceError, NoMethodError
      @element = table.div_element(class: "dealerBlock", index: i).element
    end
  end

  def get_url
    @element.a.href
  end

  def get_parameter key
    case key
    when "Количество объявлений"
      @element.div(class: "dealerTel", index: 1).
               text[/Количество объявлений: (.+)/, 1].to_i
    else
      raise "Неизвестное поле '#{key}'"
    end
  end

  def get_photo_url
    @element.p(class: "link").img.src rescue ""
  end
end
