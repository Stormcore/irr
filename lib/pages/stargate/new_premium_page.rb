# encoding: utf-8

class StargateNewPremiumPage
  include PageObject

  div :main, :xpath => "//div[contains(@class,'x-panel-bwrap')]" + 
                       "[.//span[text()='Создание премиум объявлений']]"
  list_item :root, :xpath => "//li[.//span[text()='Категории каталога']]"

  def expand_category(name)
    self.root_element.
         div_element(:text => name, :class => "x-tree-node-el").
         image_element(:class => "x-tree-elbow-plus").click
  end

  def double_click(name)
    self.root_element.
         div_element(:text => name, 
                     :class => "x-tree-node-leaf").double_click
  end
end

class StargateNewPremiumDataPage
  include PageObject

  div :panel, :id => "propspanel"

  def set_value(name, value, type)
    # Нажимаем по полю и обрабатываем
    row = self.panel_element.div_element(:class => "x-grid3-col-title", 
                                         :text => name).when_present.parent.parent
    # Скроллим до элемента
    row.element.wd.location_once_scrolled_into_view
    row.cell_element(:index => 2).when_present.click
    # Появляется editor
    editor = self.panel_element.element.
                  divs(:class => "x-editor").select{|div| div.visible?}[0].
                  when_present
    if name == "Регион"
      self.set_region_value(editor, value)
    else
      # Если в поле есть картинка - то это селект
      if editor.img.exists?
        self.set_select_value(editor, value)
      else
        self.set_text_value(editor, value)
      end
    end
  end

  def set_select_value(editor, value)
    item = self.div_element(:class => "x-combo-list-item", :text => value)
    unless item.exists? and item.visible?
      editor.img.click
      item.when_present.element.wd.location_once_scrolled_into_view
      Watir::Wait.until {item.visible?}
    end
    item.click
  end

  def set_text_value(editor, value)
    begin
      editor.text_field.value = value
    rescue Watir::Exception::UnknownObjectException => e
      editor.textarea.value = value
    end
  end

  def set_region_value(editor, value)
    # Раскрываем комбобокс
    editor.img.click
    # Ждём открытия окна "Редактирование"
    edit_window = self.div_element(
      :xpath => "//div[@class='x-window x-resizable-pinned'][.//span[text()='Редактирование']]")
    row = edit_window.when_present.div_element(
      :xpath => "//div[@class='x-form-item '][./label[text()='Регион:']]")
    row.click
    # Вводим значение региона
    row.text_field_element.value = value
    # Подверждаем выбор
    combolist = self.div_element(:class => "x-combo-list").when_present
    combolist.div_element(:class => "x-combo-list-item").click
    # Нажимаем "Сохранить"
    edit_window.button_element(:text => "Сохранить").when_present.click
  end
end
