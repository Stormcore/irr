# encoding: utf-8
class MyAdvertsPage
  include PageObject

  table :ads, :id => "psellers"
  unordered_list :bookmarks, :class => "b-bookmarksAdv"
  select_list :regions, :id => "regions"
  select_list :packages, :name => "package"

  def wait_for_ads_loaded
    self.ads_element.when_present
  end

  def get_ad_with_title(title)
    self.wait_for_ads_loaded
    element = self.ads_element.element.row(xpath: "//tr[.//a[text()='#{title}']]")
    unless element.exists?
      raise "Объявление с заголовком '#{title}' не найдено"
    end
    return MyAdvertsRecordPage.new(element)
  end

  def open_tab(name)
    self.bookmarks_element.link_element(:link_text => name).click
  end

  def select_region(name)
    self.regions_element.when_present.select name
  end
end

class MyAdvertsRecordPage
  def initialize(element)
    @element = element
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
    debugger
    @actions_for_row[0].a(text: action_name).when_present.click
  end

  def is_ad_highlighted
    @row.wd.attribute("class").include?("mark").should == true
  end

  def get_ad_id
    self.get_url_for_ad.match(/(\d+)/).to_s
  end
end