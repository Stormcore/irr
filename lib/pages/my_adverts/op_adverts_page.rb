# encoding: utf-8
class OPAdvertsPage
  include PageObject

  table :ads, id: "myadvertslist"
  unordered_list :bookmarks, class: "b-bookmarksAdv"

  def wait_for_ads_loaded
    begin
      self.ads_element.when_present(30)
    rescue Watir::Wait::TimeoutError => e
      raise "ЛК ОП не была загружена за ожидаемое время"
    end
  end

  def get_ad_with_title(title)
    self.wait_for_ads_loaded
    elements = self.ads_element.element.rows.
               select{|row| row.a(text: title).exists?}
    unless elements.size > 0
      raise "Объявление с заголовком '#{title}' не найдено"
    end
    return OPAdvertsRecordPage.new(elements[0])
  end

  def get_first_ad
    element = self.wait_for_ads_loaded.element.row(index: 1)
    unless element.exists?
      raise "Объявления отсутствуют"
    end
    return OPAdvertsRecordPage.new(element)
  end

  def open_tab(name)
    self.bookmarks_element.link_element(link_text: name).click
  end

  def delete_all_ads
    self.checkbox_element(id: "checkAll").click
    self.link_element(id: "groupActionDeleteSelected").click
    @browser.alert.ok
  end
end

class OPAdvertsRecordPage
  def initialize(element)
    @element = element
    @actions_for_row = element.tr(xpath: "following-sibling::*")
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
    @element[2].when_present.a.href
  end

  def open_ad
    @element[2].a.click
  end

  def moderation_status
    @element[6].div.text
  end

  def moderation_additional_status
    @element[6].p.text
  end

  def do_action(action_name)
    begin
      @actions_for_row[1].a(text: action_name).when_present.click
    rescue Watir::Wait::TimeoutError => e
      raise "Действие '#{action_name}' для объявления недоступно"
    end
  end

  def do_place
    @element.a(text: "Разместить").click
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
