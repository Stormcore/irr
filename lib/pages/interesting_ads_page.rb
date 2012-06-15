# encoding: utf-8

class InterestingAdsPage
  include PageObject

  div :interesting_ads, :class => "associatedGoods"
  unordered_list :ads, :xpath => "//div[@class='associatedGoods two-columns']/ul"

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
    @element.paragraph_element(:class=>"prise").text
  end
end
