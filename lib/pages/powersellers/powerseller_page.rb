class PowersellerPage
  include PageObject

  image :pseller_icon, class: "img-cover"
  table :adListTable, id: "adListTable"
  div :left_col, class: "category"

  def get_icon
    self.pseller_icon_element.when_present.attribute('src')
  end

  def get_categories_size
    self.span_elements(class: "blue-category-ads-count").size
  end

  def get_categories
    self.left_col_elements.list_item_elements(xpath: "//li").each do |el|
      yield PowerSellerCategory.new(el.when_present)
    end
  end

  def get_category_by_name(name)
    el = self.left_col_element.list_item_element(xpath: "//li[./a[text()='#{name}']]")
    PowerSellerCategory.new(el.when_present)
  end

  def get_total_categories_count
    el = self.left_col_element.
              span_element(class: "fBold").when_present.parent.
              span_element(class: "blue-category-ads-count")
    el.text.gsub(/[\(\)]/, '')
  end

  def class_selector(type="all")
    if type == "all"
      return "row"
    else
      return type
    end
  end

  def get_ads_size(type="all")
    html = Nokogiri::HTML(self.adListTable_element.when_present(10).element.html)
    html.xpath("//tr[contains(@class,'#{self.class_selector(type)}')]").size
  end

  def get_ads(type="all")
    result = []
    html = Nokogiri::HTML(self.adListTable_element.when_present(10).element.html)
    html.xpath("//tr[contains(@class, '#{self.class_selector(type)}')]").select do |x|
      result << AdInPowerSellerList.new(x)
    end
    result
  end
end

class AdInPowerSellerList
  attr_reader :has_photo,
              :has_premium_badge,
              :has_map_badge,
              :has_highlight_badge,
              :has_push_badge,
              :click_on_map_badge

  def initialize(element)
    @element = element
    @has_premium_badge = element.xpath("td//img[contains(@class, 'premium-p')]").any?
    @has_highlight_badge = element.xpath("td//img[contains(@class, 'ico-3')]").any?
    @has_push_badge = element.xpath("td//img[contains(@class, 'ico-2')]").any?
    @has_map_badge = element.xpath("td//img[contains(@class, 'ico-map')]").any?
    @has_photo = element.xpath("td//td[2]/img").any?
  end

  def get_map_href
    @element.xpath("//img[contains(@class, 'ico-map')]")[0].parent.get_attribute("href")
  end

end

class PowerSellerCategory
  attr_reader :name, :ads_count, :level, :parent, :children

  def initialize(element)
    @ads_count = element.span_element(class: "blue-category-ads-count").text.gsub(/[\[\]]/, '')
    @name = element.link_element.text
  end
end
