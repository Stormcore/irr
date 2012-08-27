# encoding: utf-8
class CategoriesBarPage
  include PageObject

  div :path, class: "wrPath"
  unordered_list (:top_categories) {|page| path_element.unordered_list_element}

  def get_all_displayed_breadcrumbs
    debugger
    get_all_displayed_breadcrumbs
  end

  def open_popup_for_section(section)
    self.path_element.link_element(link_text: section).hover
    @popup = self.div_elements(class: "popubList").select{|div| div.visible?}[0]
  end

  def get_categories_list
    @popup.unordered_list_element.element.as.map{|a| a.text.split("\n")[1]}
  end

  def get_counter_value(category_name)
    li = @popup.unordered_list_element.element.lis.select{|li| li.text.include?(category_name)}[0]
    li.span.text
  end
end
