# encoding: utf-8

class StargatePowersellerDetailsPage
  include PageObject

  div :main, xpath: "//div[@class=' x-tab-panel'][.//span[text()='Свойства']]"

  button :add_package_btn, text: "Добавить пакет"

  button (:close) {|page| page.main_element.button_element(text: 'Закрыть')}
  button (:save) {|page| page.main_element.button_element(text: "Сохранить")}

  def add_package
    self.div_element(class: "ext-el-mask").element.wait_while_present
    self.add_package_btn
  end

  def open_tab(name)
    self.span_element(class: "x-tab-strip-text ", text: name).when_present.click
    self.div_element(class: "ext-el-mask").element.wait_while_present
  end

  def open_right_click_menu_for_package(name)
    begin
      self.div_element(class: "ext-el-mask").element.wait_while_present
      self.div_elements(class: "x-tab-panel").find{|div| 
        div.span_element(text: 'Свойства').exists?}.
            div_element(class: "x-grid3-cell-inner", text: name).when_present.
            element.right_click
      Watir::Wait.until {
        not self.div_elements(class: "x-menu").find {|div| div.visible? }.nil?
      }
    rescue Watir::Wait::TimeoutError => e
      raise "Пакет '#{name}' не найден"
    end
  end

  def edit_package(name)
    self.open_right_click_menu_for_package(name)
    self.div_elements(class: "x-menu").find {|div| div.visible? }.
         link_element(class: "x-menu-item", text: "Редактировать").click
  end

  def has_package(name)
    main_element = self.div_elements(class: 'x-tab-panel').
                        find {|div| div.span_element.text == 'Свойства'}
    self.main_element.div_element(class: "x-grid3-cell-inner", text: name).exists?
  end

  def delete_package(name)
    self.open_right_click_menu_for_package(name)
    self.div_elements(class: "x-menu").find {|div| div.visible? }.
         link_element(class: "x-menu-item", text: "Удалить").click
  end

  def get_premium_number(period)
    self.table_element(id: "table_premium").when_present
    self.table_element(id: "table_premium")[1][period.to_i / 7].text.to_i
  end

  def set_premium_count(delta, period)
    self.div_element(class: "x-form-item", text: /на #{period} дней/).
         text_field_element.value=delta
    self.button_element(text: "добавить")
  end

  def save
    self.save_element.click if self.save_element.visible?
  end

  def close
    self.div_element(class: "ext-el-mask").element.wait_while_present
    self.close_element.click if self.close_element.visible?
    self.main_element.element.wait_while_present
  end
end

class StargatePowersellerDetailsPackagesTabPage
  include PageObject

  div :main, id: "pu-packagesitems-properties"

  def set_combobox_value(name, value)
    table = self.main_element.element.table(xpath: 
            "//table[.//div[contains(text(),'#{name}')][@class='x-grid3-cell-inner x-grid3-col-title']]")
    if table.exists?
      table.td(class: "x-grid3-td-value").double_click
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
  end

  def set_parameter(name, value)
    table = self.main_element.element.table(xpath: "//table[.//div[contains(text(),'#{name}')]]")
    # Скроллим до элемента
    if table.exists?
      table.element.wd.location_once_scrolled_into_view
      table.td(class: "x-grid3-td-value").double_click
      editor = self.main_element.element.
                    divs(class: "x-editor").
                    select{|div| div.visible?}[0]
      raise "Нет параметра '#{name}'" if editor.nil?
      editor.text_field.value = value
    end
  end
  
  def save
    self.main_element.button_element(text: "Сохранить").when_present.click
  end
end
