# encoding: utf-8
class MyAdvertsPage
  include PageObject

  table :ads, :id => "psellers"
  unordered_list :bookmarks, :class => "b-bookmarksAdv"
  select_list :regions, :id => "regions"

  def wait_for_ads_loaded
    self.ads_element.when_present
  end

  def get_ad_with_title(title)
    # Возращаем индекс строки
    found_row = -1
    self.ads_element.element.rows.to_a.each_with_index do |row, index|
      if row.div(:class => "txt-tb", :text => title).exists?
        found_row = index
        break
      end
    end
    found_row
  end

  def get_region(id)
    self.ads_element[id][4].text.split(" » ")[0].strip
  end

  def get_city(id)
    self.ads_element[id][4].text.split(" » ")[-1].strip
  end

  def get_price(id, currency)
    self.ads_element[id][1].element.span(:class=>currency).html[/> .* </].gsub(/[>< ]/,'').gsub(/\&nbsp\;/,'')
  end

  def get_url_for_ad(id)
    self.ads_element[id][3].link_element.element.href
  end

  def open_ad(id)
    self.ads_element[id][4].click
  end

  def do_action(id, action_name)
    self.ads_element[id+1][0].link_element(:text => action_name).when_present.click
  end

  def is_ad_highlighted(id)
    self.ads_element[id].element.wd.attribute("class").include?("mark").should == true
  end

  def open_tab(name)
    self.bookmarks_element.link_element(:link_text => name).click
  end

  def select_region(name)
    self.regions_element.when_present.select name
  end
end
