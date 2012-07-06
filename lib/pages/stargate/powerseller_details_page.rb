# encoding: utf-8

class StargatePowersellerDetailsPage
  include PageObject

  div :main, xpath: "//div[@class=' x-tab-panel'][.//span[text()='Свойства']]"

  button :add_package, text: "Добавить пакет"


  def open_tab(name)
    self.span_element(class: "x-tab-strip-text ", text: name).when_present.click
  end

  def open_right_click_menu_for_package(name)
    self.main_element.
         div_element(class: "x-grid3-cell-inner", text: name).when_present.
         element.right_click
  end

  def edit_package(name)
    self.open_right_click_menu_for_package(name)
    visible_menu = self.div_elements(class: "x-menu").
                        select {|div| div.visible? }[0]
    visible_menu.link_element(class: "x-menu-item", text: "Редактировать").click
  end

  def has_package(name)
    self.main_element.div_element(class: "x-grid3-cell-inner", text: name).exists?
  end

  def delete_package(name)
    self.open_right_click_menu_for_package(name)
    visible_menu = self.div_elements(class: "x-menu").
                        select {|div| div.visible? }[0]
    visible_menu.link_element(class: "x-menu-item", text: "Удалить").click
  end

  def save
    self.main_element.button_element(text: "Сохранить").when_present.click
  end
end

class StargatePowersellerDetailsPackagesTabPage
  include PageObject

  div :main, id: "pu-packagesitems-properties"

  def set_combobox_value(name, value)
    row_element = self.main_element.
        div_element(class: "x-grid3-cell-inner", text: name)
    row_element.when_present.
        parent.parent.cell_element(index: 2).when_present.double_click
    editor = self.main_element.element.
                  divs(class: "x-editor").
                  select{|div| div.visible?}[0].when_present
    item = self.div_element(class: "x-combo-list-item", text: value)
    unless item.exists? and item.visible?
      editor.img.click
      item.when_present.element.wd.location_once_scrolled_into_view
      Watir::Wait.until {item.visible?}
    end
    item.click
    self.div_element(class: "x-tab-panel-body").click
  end

  def set_parameter(name, value)
    row_element = self.main_element.
        div_element(class: "x-grid3-cell-inner", text: name)
    row_element.when_present.
        parent.parent.cell_element(index: 2).when_present.double_click
    editor = self.main_element.element.
                  divs(class: "x-editor").
                  select{|div| div.visible?}[0].when_present
    editor.text_field.value = value
  end
  
  def save
    self.main_element.button_element(text: "Сохранить").when_present.click
  end
end
