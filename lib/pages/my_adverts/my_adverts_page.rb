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

  def has_ad_with_title(title)
    self.wait_for_ads_loaded
    element = self.ads_element.element.rows.find{|row| row.a(text: title).exists?}
    raise "Объявление с заголовком '#{title}' не найдено" if element.nil?
    return element
  end

  def get_first_ad_id
    element = self.ads_element.element.row(index: 1)
    raise "Объявления отсутствуют" unless element.exists?
    element[3].a.href.match(/(\d+)/).to_s
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

  # Действия над объявлением
  def get_photo(title)
    self.has_ad_with_title(title)[2].img.attribute_value("src")
  end

  def get_region(title)
    self.has_ad_with_title(title)[4].text.split(" » ")[0].strip
  end

  def get_city(title)
    self.has_ad_with_title(title)[4].text.split(" » ")[-1].strip
  end

  def get_price(title, currency)
    self.has_ad_with_title(title)[1].span(class: currency).
            html[/> .* </].gsub(/[>< ]/,'').gsub(/\&nbsp\;/,'')
  end

  def get_url_for_ad(title)
    has_ad_with_title(title)[3].a.href
  end

  def open_ad(title)
    self.has_ad_with_title(title)[4].click
  end

  def moderation_status(title)
    self.has_ad_with_title(title)[6].div.text
  end

  def moderation_additional_status(title)
    self.has_ad_with_title(title)[6].p.text
  end

  def do_action(title, action_name)
    begin
      self.has_ad_with_title(title).tr(xpath: "following-sibling::*")[0].
        a(text: action_name).when_present.click
    rescue Watir::Wait::TimeoutError => e
      raise "Действие '#{action_name}' для объявления недоступно"
    end
  end

  def is_ad_highlighted(title)
    self.has_ad_with_title(title).wd.attribute("class").include?("mark")
  end

  def is_ad_premium(title)
    self.has_ad_with_title(title).wd.attribute("class").include?("premium")
  end

  def get_ad_id(title)
    self.get_url_for_ad(title).match(/(\d+)/).to_s
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
      link = self.category_list_element.link_element(link_text: "Все разделы")
      link.parent.span_element.text
    rescue Exception => e
      puts "Не найден счетчик для всех разделов"
      return 0
    end
  end
end
