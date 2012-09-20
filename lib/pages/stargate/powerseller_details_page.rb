# encoding: utf-8

class StargatePowersellerDetailsPage
  include PageObject

  div :main, xpath: "//div[@class=' x-tab-panel'][.//span[text()='Свойства']]"

  button :add_package_btn, text: "Добавить пакет"

  button (:close) {|page| page.main_element.button_element(text: 'Закрыть')}
  button (:save) {|page| page.main_element.button_element(text: "Сохранить")}

  def wait_for_masks_to_disappear
    Watir::Wait.until { 
      self.div_elements(class: "ext-el-mask").find {|d| d.visible?}.nil? 
    }
  end

  def add_package
    self.wait_for_masks_to_disappear
    self.add_package_btn
  end

  def open_tab(name)
    self.span_element(class: "x-tab-strip-text ", text: name).when_present.click
    self.wait_for_masks_to_disappear
    # Ждём пока загрузятся пакеты
    if name == "Пакеты"

      len = self.div_elements(class: "x-tab-panel").select{|div| 
            div.span_element(text: 'Пакеты').exists?}.last.element.
                divs(class: "x-grid3-body").last.
                    divs(class: "x-grid3-row").length
      puts "Найдено пакетов: #{len}"
      if len == 0
        self.open_tab("Свойства")
        self.open_tab("Пакеты")
      end
    end
  end

  def open_right_click_menu_for_package(name)
    begin
      self.wait_for_masks_to_disappear
      # Ищем пакет
      package = self.div_elements(class: "x-tab-panel").select{|div| 
                  div.span_element(text: 'Пакеты').exists?}.last.element.
                    divs(class: "x-grid3-body").last.when_present.
                      div(class: "x-grid3-cell-inner", text: name).when_present
      # Открываем меню райт-кликом
      package.right_click
      # Ждём пока меню откроется
      Watir::Wait.until {
        not self.div_elements(class: "x-menu").find {|div| div.visible? }.nil?
      }
    rescue Exception => e
      raise "Пакет '#{name}' не найден"
    end
  end

  def edit_package(name)
    self.open_right_click_menu_for_package(name)
    self.div_elements(class: "x-menu").find {|div| div.visible? }.
         link_element(class: "x-menu-item", text: "Редактировать").click
  end

  def has_package(name)
    self.div_elements(class: "x-tab-panel").select{|div| 
         div.span_element(text: 'Пакеты').exists?}.last.element.
             divs(class: "x-grid3-body").last.when_present.
                 div(class: "x-grid3-cell-inner", text: name).exists?
  end

  def delete_package(name)
    if self.has_package(name)
      self.open_right_click_menu_for_package(name)
      self.div_elements(class: "x-menu").find {|div| div.visible? }.
           link_element(class: "x-menu-item", text: "Удалить").click
    end
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
    self.wait_for_masks_to_disappear
    self.close_element.click if self.close_element.visible?
    self.main_element.element.wait_while_present
  end
end

class StargatePowersellerDetailsPackagesTabPage
  include PageObject

  div :main, id: "pu-packagesitems-properties"

  def set_combobox_value(name, value)
    Watir::Wait.until {
      self.main_element.div_element(class: "x-grid3-col-title", text: name).exists?
    }

    table = self.main_element.element.table(xpath: 
            "//table[.//div[contains(text(),'#{name}')][@class='x-grid3-cell-inner x-grid3-col-title']]")
    if table.exists?
      table.td(class: "x-grid3-td-value").double_click
      Watir::Wait.until {
        not self.main_element.element.divs(class: "x-editor").
                 find{|div| div.visible?}.nil?
      }
      editor = self.main_element.element.divs(class: "x-editor").
                    find{|div| div.visible?}.when_present
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
      Watir::Wait.until {
        not self.main_element.element.divs(class: "x-editor").
                 find{|div| div.visible?}.nil?
      }
      editor = self.main_element.element.
                    divs(class: "x-editor").
                    find{|div| div.visible?}
      raise "Нет параметра '#{name}'" if editor.nil?
      editor.text_field.value = value
    end
  end
  
  def save
    self.main_element.button_element(text: "Сохранить").when_present.click
  end
end
