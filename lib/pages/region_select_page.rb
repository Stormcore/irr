# encoding: utf-8
class RegionSelectPage
  include PageObject

  div :title, class: "windowTitle"

  div :countries, class: "windowCategoriesList"
  div :oblasts, class: "regionWinRegionList"
  div :cities, class: "windowItemsTable"

  div :apply, id: "regionSelectApply"

  def initialize_page
    self.title_element.when_present
  end

  def wait_for_loaders_to_disappear
    # Ждём пока все лоадеры станут невидимы
    Watir::Wait.until {
      not self.div_elements(class: "preload").map{|d| d.visible?}.include?(true)
    }
  end

  def select_region region
    if region.include?(' -> ')
      # Если регион сложный (содержит страну и область), то 
      self.select_country region.split(' -> ')[0]
      self.select_oblast region.split(' -> ')[1]
      self.select_city region.split(' -> ')[2]
    else
      # Выбираем из популярных городов
      self.select_city region
    end
    self.close_dialog
  end

  def select_from_list element_list, value, error_message
    self.wait_for_loaders_to_disappear
    element = element_list.element.as.find {|a| a.text == value}
    raise error_message if element.nil?
    element.click
    self.wait_for_loaders_to_disappear
  end

  def select_country country
    self.select_from_list self.countries_element, 
                          country, "Страна '#{country}' не найдена"
  end

  def select_oblast oblast
    self.select_from_list self.oblasts_element, 
                          oblast, "Область '#{oblast}' не найдена"
  end

  def select_city city
    self.select_from_list self.cities_element, 
                          city, "Город '#{city}' не найдена"
  end

  def close_dialog
    self.apply_element.link_element.click
  end
end
