# encoding: utf-8
class AddAdvertStep1
  include PageObject

  link :next_step, :id => "nextStep2"

  def wait_for_category_to_appear(category_i)
    self.unordered_list_element(:xpath => "//li[@id='section_#{category_i}']/ul").when_present.click
  end

  def select_item_from_category(category_i, item_text)
    self.link_element(:xpath => "//li[@id='section_#{category_i}']//a[.='#{item_text}']").when_present.click
  end
end
