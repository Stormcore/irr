# encoding: utf-8
class AddAdvertStep1
  include PageObject

  link :next_step, id: "nextStep2"

  def wait_for_category_to_appear(category_i)
    self.unordered_list_element(xpath: "//li[@id='section_#{category_i}']/ul").when_present.click
  end

  def select_item_from_category(category_i, item_text)
    li = self.list_item_element(id: "section_#{category_i}")
    a = li.link_elements(href: "#").select do |a|
      UnicodeUtils.downcase(a.text) == UnicodeUtils.downcase(item_text)
    end
    raise "Категория '#{item_text}' не найдена" unless a.size > 0
    a[0].click
  end
end
