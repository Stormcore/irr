# encoding: utf-8

class RegionSelectPage
  include PageObject

  unordered_list :trigger, class: "header_choose-region"

  div :popupRegions, class: "popupRegions"
  span (:header) {|page| popupRegions_element.div_element(class: 'b-title').span_element}

  div :firstlevel, id: "column-first"
  div :secondlevel, id: "column-second"
  div :thirdlevel, id: "column-third"

  span :selected_region, xpath: "//p[@id='statusbar']/span"

  link :ok, xpath: "//div[@class='button-style btn-a']/a"

  text_field :search, class: "ui-autocomplete-input"
  div :suggests, class: "b-searchRegion"

  def get_element_by_level(level)
    case level
    when "1"
      self.firstlevel_element
    when "2"
      self.secondlevel_element
    when "3"
      self.thirdlevel_element
    when "поиска"
      self.suggests_element
    end
  end

  def open_dialog
    self.trigger_element.click unless self.popupRegions_element.visible?
  end

  def search_for(search_term)
    self.search = search_term
    self.suggests_element.when_present
  end

  def select_link_from_level(level, text)
    text = "Москва " if text == "Москва"
    link = get_element_by_level(level).element.as.find{|a| a.text == text}
    link.wd.location_once_scrolled_into_view
    link.click
  end

  def get_all_links_elements_in_level(level)
    get_element_by_level(level).element.as
  end

  def get_all_links_in_level(level)
    get_element_by_level(level).element.as.map{|a| a.text}
  end

  def is_level_visible(level)
    get_element_by_level(level).visible?
  end

  def select_region_from_dropdown(region)
    #self.regions_element.link_element(link_text: region).click
    self.search = region
    self.suggests_element.when_present.link_element.click
  end
end
