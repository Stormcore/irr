# encoding: utf-8

class InterestingAdsPage
  include PageObject

  div :interesting_ads, class: "associatedGoods"
  unordered_list (:ads) {|page| page.interesting_ads_element.unordered_list_element}

  def get_ads_number
    self.ads_element.items
  end
end

class InterestingAd
  def initialize (element)
    @element = element
  end

  def get_photo
    @element.image_element.attribute("src")
  end

  def get_price
    @element.paragraph_element(class: "prise").text
  end

  def open_ad
    @element.element.link.click
  end

  def get_id
    @element.element.link.href.match(/(\d+)/).to_s
  end
end
