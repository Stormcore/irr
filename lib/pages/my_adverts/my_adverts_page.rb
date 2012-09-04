# encoding: utf-8
class MyAdvertsPage
  include PageObject

  table :ads, id: "psellers"
  unordered_list :bookmarks, class: "b-bookmarksAdv"
  select_list :regions, id: "regions"
  select_list :packages, name: "package"

  link :delete_all, text: "Удалить все"

  def wait_for_ads_loaded
    begin
      self.ads_element.when_present(30)
    rescue Watir::Wait::TimeoutError => e
      raise "ЛК ИП не была загружена за ожидаемое время"
    end
  end

  def get_ad_with_title(title)
    self.wait_for_ads_loaded
    element = self.ads_element.element.row(xpath: "//tr[.//a[text()='#{title}']]")
    unless element.exists?
      raise "Объявление с заголовком '#{title}' не найдено"
    end
    return MyAdvertsRecordPage.new(element)
  end

  def get_first_ad
    element = self.wait_for_ads_loaded.element.row(index: 1)
    unless element.exists?
      raise "Объявления отсутствуют"
    end
    return MyAdvertsRecordPage.new(element)
  end

  def open_tab(name)
    self.bookmarks_element.link_element(link_text: name).click
  end

  def select_region(name)
    self.regions_element.when_present.select name
  end

  def delete_all_ads
    if self.delete_all?
      self.delete_all
      @browser.alert.ok
    end
  end
end

class MyAdvertsRecordPage
  def initialize(element)
    @element = element
    @actions_for_row = element.tr(xpath: "following-sibling::*")
  end

  def get_photo
    @element[2].img.attribute_value("src")
  end

  def get_region
    @element[4].text.split(" » ")[0].strip
  end

  def get_city
    @element[4].text.split(" » ")[-1].strip
  end

  def get_price(currency)
    @element[1].span(class: currency).
                html[/> .* </].gsub(/[>< ]/,'').gsub(/\&nbsp\;/,'')
  end

  def get_url_for_ad
    @element[3].a.href
  end

  def open_ad
    @element[4].click
  end

  def moderation_status
    @element[6].div.text
  end

  def moderation_additional_status
    @element[6].p.text
  end

  def do_action(action_name)
    begin
      @actions_for_row[0].a(text: action_name).when_present.click
    rescue Watir::Wait::TimeoutError => e
      raise "Действие '#{action_name}' для объявления недоступно"
    end
  end

  def is_ad_highlighted
    @element.wd.attribute("class").include?("mark").should == true
  end

  def is_ad_premium
    @element.wd.attribute("class").include?("premium").should == true
  end

  def get_ad_id
    self.get_url_for_ad.match(/(\d+)/).to_s
  end
end

class PSellerCategoriesPage
  include PageObject

  div :category_list, id: "category_tree_list"

  def get_counter_for_category(category)
    begin
      link = self.category_list_element.link_element(link_text: category)
      link.parent.span_element.text
    rescue Exception => e
      puts "Не найден счетчик для категории #{category}"
      return 0
    end
  end

  def get_counter_for_all_categories
    begin
      link = self.category_list_element.link_element(link_text: "Все разда\елы")
      link.parent.span_element.text
    rescue Exception => e
      puts "Не найден счетчик для всех разделов"
      return 0
    end
  end
end
