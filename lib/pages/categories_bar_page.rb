# encoding: utf-8
class CategoriesBarPage
  include PageObject

  div :path, class: "wrPath"
  unordered_list (:top_categories) {|page| path_element.unordered_list_element}

  def open_popup_for_section(section)
    self.path_element.link_element(link_text: section).hover
    @popup = self.div_elements(class: "popubList").select{|div| div.visible?}[0]
    puts "Выпадающий список не открыт" if @popup.nil?
  end

  def get_categories_list
    return [] if @popup.nil?
    @popup.unordered_list_element.element.as.map{|a| a.text.split("\n")[1]}
  end

  def get_counter_value(category_name)
    return 0 if @popup.nil?
    li = @popup.unordered_list_element.element.lis.select{
      |li| li.text.split("\n")[1] == category_name}[0]
    li.span.text.gsub(" ", '') unless li.nil?
  end

  def get_total_ads_count
    self.get_counter_value("Все разделы")
  end
end
