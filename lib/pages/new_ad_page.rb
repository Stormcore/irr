# encoding: utf-8
class NewAdPage
  include PageObject

  div :content, class: "content"
  link :region_selector, id: "newAdRegionsSelect"

  select :rubric, id: "rubric_uri"
  button :submit, id: "submitAd"

  text_field :price, id: "price_field"
  select :currency, id: "currency_field"

  file_field :photo, name: "photo"
  button :upload_button, id: "logoUploadButton"
  div :photoList, id: "photoList"

  div :errors_block, id: "popupErrorBlock"

  def initialize_page
    self.content_element.when_present
  end

  def is_displayed?
    self.content_element.element.
         h1(text: "Новое объявление").when_present.exists?
  end

  def open_region_selector
    self.region_selector_element.click
  end

  def set_section section
    self.rubric = section
  end

  def continue
    self.submit
  end

  def set_checkbox_value section_div, field, value
    section_div.element.label(text: field).checkbox.click
  end

  def set_generic_value section, field, value
    # Ищем секцию
    begin
      section_title = self.div_element(class: "paramGroupTitle", text: section).when_present
      section_div = section_title.parent
    rescue Watir::Wait::TimeoutError => e
      raise "Секция '#{section}' не найдена"
    end

    # Чекбокс
    if value == 'x' and section_div.element.label(text: field).exists?
      self.set_checkbox_value section_div, field, value 
      return
    end

    field_title_regular = section_div.div_element(class: "paramName", text: field)
    field_title_starred = section_div.div_element(class: "paramName", text: "* #{field}")

    unless (not field_title_regular.exists? or not field_title_starred.exists?)
      raise "Поле '#{field}' не найдено"
    end
    field_div = field_title_regular.parent if field_title_regular.exists?
    field_div = field_title_starred.parent if field_title_starred.exists?

    # Угадываем, что за элемент
    value_div = field_div.div_element(class: "paramValueInner")
    has_select = value_div.select_list_element.exists?
    has_textbox = value_div.text_field_element.exists?
    has_radiobox = value_div.radio_button_element.exists?

    value_div.select_list_element.select value if has_select
    value_div.text_field_element.value = value if has_textbox
    value_div.radio_button_element(value: value).select if has_radiobox
  end

  def set_value section, field, value
    # Обрабатываем особые случаи
    case field
    when "Цена"
      self.price = value
    when "Валюта"
      self.currency = value
    else
      set_generic_value section, field, value
    end
  end

  def upload_foto
    # Загружаем файл из URL
    Net::HTTP.start("mandroid.ru") do |http|
      resp = http.get("/sites/default/files/imagecache/full-node-news/softattached/irr.png")
      open("/tmp/logo_irr.png", "wb") do |file|
        file.write(resp.body)
      end
    end
    self.photo = "/tmp/logo_irr.png"
    self.upload_button
    Watir::Wait.until { self.photoList_element.image_element.exists? }
  end

  def submit_ad
    self.submit_element.element.wd.location_once_scrolled_into_view
    self.submit
  end

  def has_errors?
    begin
      Watir::Wait.until(5) { self.errors_block_element.visible?}
      return true
    rescue
      return false
    end
  end

end
