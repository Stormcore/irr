# encoding: utf-8

class AtlantisNewsListPage
  include PageObject

  div :main, id: "doc-body"

  def wait_for_page_to_be_opened
    self.span_element(class: "x-tab-strip-text", text: "Новости").when_present
  end

  def open_news_add_dialog
    self.main_element.button_element(text: "Создать (Ctrl+N)").when_present.click
  end

  def has_news? name
    debugger
    name
  end

end

class AtlantisNewsAddPage
  include PageObject

  div (:main) { |p| 
    p.div_elements(class: "x-tab-panel").find{|d| 
      d.span_element(class: "x-tab-strip-text", text: "Свойства").exists?
    }
  }
  button :save, text: "Сохранить"

  def set_parameter hash
    name = hash['поле']
    value = hash['значение']
    # Нажимаем по полю и обрабатываем
    row = self.main_element.div_element(class: "x-grid3-col-title", 
                                         text: name).when_present.parent.parent
    # Скроллим до элемента
    row.element.wd.location_once_scrolled_into_view
    row.cell_element(index: 2).when_present.double_click
    # Появляется editor
    editor = self.main_element.when_present.element.
                  divs(class: "x-editor").find {|e| e.visible?}
    raise "Не открыт редактор" if editor.nil?
    # Если в поле есть картинка - то это селект
    if editor.img.exists?
      self.set_combobox_value(editor, value)
    else
      if editor.select.exists?
        self.set_checkbox_value(editor, value)
      else
        self.set_text_value(editor, value)
      end
    end
  end

  def open_editor_for_title name
    title = nil
    Watir::Wait.until {
      title = self.main_element.element.divs(class: "x-grid3-col-title").find {|d|
        d.text.include?(name) }
      not title.nil?
    }
    raise "Не найдено поле ввода с текстом '#{name}'" if title.nil?
    title.wd.location_once_scrolled_into_view
    Watir::Wait.until { 
      self.div_elements(class: "ext-el-mask").find {|d| d.visible?}.nil? 
    }
    title.parent.parent.td(class: "x-grid3-td-value").click
    editor = nil
    Watir::Wait.until {
      editor = self.main_element.element.divs(class: "x-editor").
               find{|div| div.visible?}
      not editor.nil?
    }
    editor
  end

  def set_combobox_value(editor, value)
    combolist = nil
    item = nil
    # Ждём раскрытия комбокса
    begin 
      Watir::Wait.until(1) {
        combolist = self.div_elements(class: "x-combo-list-inner").
                         find {|d| d.visible?}
        combolist.nil? == false
      }
    rescue Watir::Wait::TimeoutError => e
      # Не раскрылся - нажимаем на кнопку еще раз и снова ждём
      editor.click
      retry
    end

    # Ищем элемент
    begin
      item = combolist.div_element(class: "x-combo-list-item", text: value)
      item.when_present.element.wd.location_once_scrolled_into_view
      item.click
    rescue Watir::Wait::TimeoutError => e
      puts "combolist #{combolist.visible?}"
      puts "item.visible? #{item.visible?}"
      raise "Значение '#{value}' не найдено"
    end
    
    # Закрываем комбобокс, если это чеклист, например
    editor.img.click if item.visible?
  end

  def set_text_value(editor, value)
    if editor.text_field.exists?
      editor.text_field.value = value
    else
      editor.textarea.value = value
    end
  end

  def set_checkbox_value(editor, value)
    editor.select.select value
  end

  def upload_picture
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
    self.save_element.when_present
    self.save_element.element.wd.location_once_scrolled_into_view
    sleep 1
    self.save_element.click
  end

  def go_to_tab(name)
    self.link_element(text: name).click
  end

  def add_photo
    self.go_to_tab "Фотографии"
    self.upload_picture
  end

end
