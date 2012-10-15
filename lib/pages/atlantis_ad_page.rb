# encoding: utf-8

class AtlantisAdSearchPage
  include PageObject

  div :main, id: "classified_ads"
  text_field :id_input, id: "classified_ads-filter-0"

  def wait_for_page_to_be_opened
    self.main_element.when_present
  end

  def wait_for_mask_to_disappear
    Watir::Wait.until { 
      self.div_elements(class: "ext-el-mask").find {|d| d.visible?}.nil? 
    }
  end

  def search_by_id ad_id
    self.wait_for_mask_to_disappear
    self.id_input_element.when_present.value = ad_id[/id: (\d+);/,1]
    self.id_input_element.send_keys "\n"
  end

  def get_all_results_size
    self.wait_for_mask_to_disappear
    self.main_element.div_element(class: "x-grid3-scroller").
         table_elements(class: "x-grid3-row-table").size
  end

  def accept_ad index
    table = self.main_element.div_element(class: "x-grid3-scroller").
                 table_element(class: "x-grid3-row-table", index: index-1).
                     element.right_click
    self.link_element(text: "Принять").when_present.click
    self.wait_for_mask_to_disappear
  end

end
