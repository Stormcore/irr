# encoding: utf-8
class OPAdvertsPage
  include PageObject

  table :ads, id: "myadvertslist"
  unordered_list :bookmarks, class: "b-bookmarksAdv"

  div (:categories) { |page| 
    page.div_elements(class: "b-blockInf").find{ |div| 
      div.div_element(class: "b-title", text: "Категории").exists?
    }
  }

  def wait_for_ads_loaded
    begin
      self.ads_element.when_present(30)
    rescue Watir::Wait::TimeoutError => e
      raise "ЛК ОП не была загружена за ожидаемое время"
    end
  end

  def get_first_active_ad
    self.wait_for_ads_loaded
    element = self.ads_element.element.rows.find{|row| 
      row[6].div.text == "размещено"}
    element[2].text
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
    element[2].a.href.match(/(\d+)/).to_s
  end

  def open_tab(name)
    self.bookmarks_element.link_element(link_text: name).click
  end

  def delete_all_ads
    self.checkbox_element(id: "checkAll").click
    self.link_element(id: "groupActionDeleteSelected").click
    @browser.alert.ok
  end

  def get_counter_for_category(category)
    link = self.categories_element.element.links.find{|l| 
      l.text.split("\n")[1] == category}
    return 0 if link.nil?
    link.div.text
  end

  def get_counter_for_all_categories
    link = self.categories_element.element.lis.find{|l| 
      l.text.split("\n")[1] == "Все категории"}
    return 0 if link.nil?
    link.div(class: "floatRight").text
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
    self.has_ad_with_title(title)[2].when_present.a.href
  end

  def open_ad(title)
    self.has_ad_with_title(title)[2].a.click
  end

  def moderation_status(title)
    self.has_ad_with_title(title)[6].div.text
  end

  def moderation_additional_status(title)
    self.has_ad_with_title(title)[6].p.text
  end

  def do_action(title, action_name)
    begin
      self.has_ad_with_title(title).tr(xpath: "following-sibling::*")[1].
           a(text: action_name).when_present.click
    rescue Watir::Wait::TimeoutError => e
      raise "Действие '#{action_name}' для объявления недоступно"
    end
  end

  def do_place(title)
    self.has_ad_with_title(title).a(text: "Разместить").click
  end

  def is_ad_highlighted(title)
    self.has_ad_with_title(title).wd.attribute("class").include?("mark")
  end

  def is_ad_premium(title)
    self.has_ad_with_title(title).wd.attribute("class").include?("premium")
  end

  def get_ad_id(title)
    self.has_ad_with_title(title)[2].when_present.a.href.match(/(\d+)/).to_s
  end
end

class OPPackageInfoPage
  include PageObject

  div (:statuses) { |page| 
    page.div_elements(class: "b-blockInf").find{ |div| 
      div.div_element(class: "b-title", text: "Статус").exists?
    }
  }

  def get_active_counter
    link = self.statuses_element.element.links.find{|l| 
      l.text.split("\n")[1] == "Активные"}
    return 0 if link.nil?
    link.div.text
  end

  def get_inactive_counter
    link = self.statuses_element.element.links.find{|l| 
      l.text.split("\n")[1] == "Снятые с размещения"}
    return 0 if link.nil?
    link.div.text
  end
end
