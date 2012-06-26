# encoding: utf-8

class StargatePowersellersPage
  include PageObject

  # Панель поиска
  div :main, id: "powerusers-search-panel"
  text_field :login, xpath: "//div[@class='x-form-item '][.//label[text()='Login:']]//input"
  button :search, text: "Искать"

  # Пункты выпадающего меню для результатов
  link :edit, class: "x-menu-item", text: "Редактировать"

  def search_for_powerseller(name)
    self.login = name
    self.search
  end

  def open_details_for_first_found_result
    result = self.main_element.div_element(class: "x-grid3-cell-inner").when_present
    result.element.right_click
    self.edit_element.when_present.click
  end

end