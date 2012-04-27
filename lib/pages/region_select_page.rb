class RegionSelectPage
  include PageObject

  direct_url BASE_URL

  span :header, :xpath => "//div[@class='popupRegions']//div[@class='b-title']/span"

  div :countries, :id => "column-first"
  div :regions, :id => "column-second"

  span :selected_region, :xpath => "//p[@id='statusbar']/span"

  link :ok, :xpath => "//div[@class='button-style btn-a']/a"

  def select_country(country)
    self.countries_element.link_element(:link_text => country).click
  end

  def select_region(region)
    self.regions_element.link_element(:link_text => region).click
  end
end
