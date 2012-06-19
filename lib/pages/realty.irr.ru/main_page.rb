# encoding: utf-8

class RealtyIrrRuMainPage
  include PageObject

  direct_url BASE_URL.gsub("http://", "http://realty.")

  link :region_select, :id => "select_region"
  select_list :oRegions, :id => "oRegions"

  def select_region(region)
    unless self.region_select_element.when_present.text == region
      self.region_select
      self.oRegions_element.when_present.select region
      self.region_select_element.when_present
    end
  end
end
