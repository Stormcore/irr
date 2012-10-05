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
    @price = element.paragraph_element(class: "prise").text
    @photo = element.image_element.attribute("src")
    @url = element.element.link.href
    @id = @url[/advert(\d+).html/, 1]
  end

  def get_photo
    @photo
  end

  def get_price
    @price
  end

  def get_url
    @url
  end

  def get_id
    @id
  end
end
