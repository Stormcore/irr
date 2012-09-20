# encoding: utf-8

class StargateCatalogSelectPage
  include PageObject

  list_item :root, xpath: "//li[.//span[text()='Категории каталога']]"

  def expand_category(name)
    begin
      self.root_element.when_present.
           div_element(text: name, class: "x-tree-node-el").when_present.
          image_element(class: "x-tree-ec-icon").click
    rescue Exception => e
      puts "Ошибка раскрытия категории '#{name}', #{e}"
    end
  end

  def double_click(name)
    self.root_element.
         div_element(text: name, 
                     class: "x-tree-node-leaf").double_click
  end

  def create_new_advert
    Watir::Wait.until { 
      self.div_elements(class: "ext-el-mask").find {|d| d.visible?}.nil? 
    }
    self.button_element(text: "Создать").when_present.click
  end
end

class StargateNewAdDataPage
  include PageObject

  div :panel, class: "x-grid-panel", text: /Поле/
  button :save, text: "Сохранить"

  def set_value(name, value, dont_do_the_double_click)
    # Нажимаем по полю и обрабатываем
    row = self.panel_element.div_element(class: "x-grid3-col-title", 
                                         text: name).when_present.parent.parent
    # Скроллим до элемента
    row.element.wd.location_once_scrolled_into_view
    if dont_do_the_double_click
      row.cell_element(index: 2).when_present.click
    else
      row.cell_element(index: 2).when_present.double_click
    end
    # Появляется editor
    editor = self.panel_element.when_present.element.
                  divs(class: "x-editor").find {|e| e.visible?}
    raise "Не открыт редактор" if editor.nil?
    if name == "Регион"
      self.set_region_value(editor, value)
    else
      # Если в поле есть картинка - то это селект
      if editor.img.exists?
        self.set_select_value(editor, value)
      else
        if editor.select.exists?
          self.set_checkbox_value(editor, value)
        else
          self.set_text_value(editor, value)
        end
      end
    end
  end

  def set_select_value(editor, value)

    attempts = 0
    begin
      attempts += 1
      Watir::Wait.until(5) {
        self.div_elements(class: "x-combo-list-inner").
           find { |div| div.visible?}.nil? == false
      }
    rescue Watir::Wait::TimeoutError => e
      editor.img.click
      retry if attempts == 1
    end
    begin
      item = self.div_element(class: "x-combo-list-item", text: value)
      item.when_present(10)
    rescue Watir::Wait::TimeoutError => e
      debugger
      raise "Нет такого значения '#{value}'"
    end
    item.when_present.element.wd.location_once_scrolled_into_view
    item.click
    # Закрываем комбобокс, если это чеклист, например
    editor.img.click if item.visible?
  end

  def set_text_value(editor, value)
    begin
      editor.text_field.value = value
    rescue Watir::Exception::UnknownObjectException => e
      editor.textarea.value = value
    end
  end

  def set_checkbox_value(editor, value)
    editor.select.select value
  end

  def set_region_value(editor, value)
    # Раскрываем комбобокс
    editor.img.click
    # Ждём открытия окна "Редактирование"
    edit_window = self.div_element(
      xpath: "//div[@class='x-window x-resizable-pinned'][.//span[text()='Редактирование']]")
    row = edit_window.when_present.div_element(
      xpath: "//div[@class='x-form-item '][./label[text()='Регион:']]")
    row.click
    # Вводим значение региона
    row.text_field_element.value = value
    # Подверждаем выбор
    combolist = self.div_element(class: "x-combo-list").when_present
    combolist.div_element(class: "x-combo-list-item").when_present.click
    # Нажимаем "Сохранить"
    edit_window.button_element(text: "Сохранить").when_present.click
  end

  def upload_picture()
    # Загружаем файл из URL
    Net::HTTP.start("mandroid.ru") do |http|
      resp = http.get("/sites/default/files/imagecache/full-node-news/softattached/irr.png")
      open("/tmp/logo_irr.png", "wb") do |file|
        file.write(resp.body)
      end
    end
    # Сначала удаляем стиль у элемента
    photo_element = self.div_elements(class: "x-panel-body").
                         select{|div| div.file_field_element.exists?}[1]
    el_id = photo_element.file_field_element.element.id
    @browser.execute_script("document.getElementById('#{el_id}').setAttribute('style', '')")
    photo_element.file_field_element.value="/tmp/logo_irr.png"
    photo_element.element.button(text: "Закачать").click
    Watir::Wait.until {photo_element.element.imgs.size > 0}
  end

  def save_ad
    self.save_element.when_present.click
  end

  def go_to_tab(name)
    self.link_element(text: name).click
  end

  def has_dialog_window
    Watir::Wait.until do
      self.div_element(xpath: "//div[@class='x-window x-window-plain x-window-dlg']" + 
        "[.//span[text()='Запись добавлена']]").
      exists?
    end
  end

  def close_dialog_window
    self.button_element(text: "OK").when_present.click
  end
end

class StargateNewPremiumDataPage
  include PageObject
  div :premium, xpath: "//div[@class='x-panel x-panel-noborder x-form-label-left']" + 
                          "[.//legend/span[text()='Премиум объявления']]"

  def set_premium_period(premium_length)
    self.premium_element.div_element(
      xpath: "//div[@class='x-form-item '][./label[text()='#{premium_length}:']]").
      div_element(class: "x-form-radio-wrap-inner").
      click
  end
end
