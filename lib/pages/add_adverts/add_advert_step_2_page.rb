# encoding: utf-8
class AddAdvertStep2 < AdDetailsPage
  include PageObject

  link :region_spoiler, name: "region_link"
  select_list :region, id: "fr-region"
  text_field  :address_city, name: "address_city"
  text_field  :address_street, name: "mapStreetVisible"
  text_field  :address_house, name: "mapHouseNr"
  text_field  :address_metro, name: "metro"
  text_field  :address_sosshe, name: "sosshe"
  select_list :rent_period, name: "rent_period"

  select_list :mark, name: "make"
  select_list :model, name: "model"

  text_field :f_title, id: "f_title"
  text_field :f_text, id: "f_text"
  file_field :upload, id: "input-file-upload"
  unordered_list :uploaded_photos, id: "photos"
  link :add_video, id: "showPopupVideoAdd"

  div :videoPopup, id: "popupVideoAdd"
  text_field :videoContents, id: "video_content"
  link :uploadVideoButton, id: "uploadVideoButton"
  div :video_preview, id: "videoContentBlock"

  link :save, id: "submit-edit-form"
  link :next_step, id: "next_link"

  div :no_package_message, id: "message-free-add"
  div :has_package, class: "ico-messagesok"

  def set_region(region)
    self.region_spoiler_element.when_present.click
    self.region_element.when_present.visible?.should == true
    self.region = region
  end

  def set_street(street)
    self.address_street = street
    self.link_element(xpath: "//ul[contains(@class,'ui-autocomplete')]" + 
                                 "[contains(@style,'display: block')]//a").when_present.click
  end

  def set_shosse(shosse)
    self.address_shosse = shosse
    self.link_element(xpath: "//ul[contains(@class,'ui-autocomplete')]" + 
                                 "[contains(@style,'display: block')]//a").when_present.click
  end

  def set_house(house)
    self.address_house = house
    self.link_element(xpath: "//ul[contains(@class,'ui-autocomplete')]" + 
                                 "[contains(@style,'display: block')]//a").when_present.click
  end

  def set_metro(metro)
    self.address_metro = metro
    self.link_element(xpath: "//ul[contains(@class,'ui-autocomplete')]" + 
                                 "[contains(@style,'display: block')]//a").when_present.click
  end

  def set_city(city)
    self.address_city = city
    self.link_element(xpath: "//ul[contains(@class,'ui-autocomplete')]" + 
                                 "[contains(@style,'display: block')]//a").when_present.click
  end

  def set_value_for_custom(control, hash)
    # По типу следующего контрола устанавливаем значение
    case control.tag_name
    when "select"
      # Комбобокс
      self.select_list_element(id: control.id).select hash["value"]
    when "label"
      # Другие параметры - скрыты внутри лейбла
      control.text_field.value = hash["value"]
    else
      # Текстбокс и комбобокс - разделены ~
      control.text_field.value = hash["value"].split(" ~ ")[0]
      control.parent.select_list.select hash['value'].split(" ~ ")[1]
    end
  end

  def set_custom_parameter(hash)
    # Ищем ближайший контрол по hash['parameter']
    # Сначала checkbox
    begin
      self.checkbox_element(xpath: "//label[contains(.,'#{hash['parameter']}')]/input").check
    rescue Watir::Exception::UnknownObjectException => e
      label = self.div_element(text: /#{hash['parameter']}/, class: "lbl")
      control = label.element.elements(xpath: "following-sibling::*")[0]
      if (control.tag_name == 'div') and
         (control.attribute_value("class") == "hid-o")
         control = control.label
      end
      set_value_for_custom(control, hash)
    end
  end

  def set_parameter(hash)
    begin
      case hash['parameter']
      when "Регион"
        self.set_region hash['value']
      when "Населённый пункт"
        self.set_city hash['value']
      when "Улица"
        self.set_street hash['value']
      when "Дом"
        self.set_house hash['value']
      when "Ближайшее метро"
        self.set_metro hash['value']
      when "Заголовок"
        self.f_title = hash['value']
      when "Срок сдачи"
        self.rent_period = hash['value']
      when "Марка"
        self.mark = hash['value']
      when "Модель"
        self.model = hash['value']
      when "Текст"
        self.f_text = hash['value']
      else
        self.set_custom_parameter(hash)
      end
    rescue Exception => e
      raise "Ошибка установки параметра #{hash['parameter']} = '#{hash['value']}':\n#{e}"
    end
  end

  def load_photo
    # Загружаем файл из URL
    Net::HTTP.start("userlogos.org") do |http|
      resp = http.get("/files/logos/x-b/irr.png")
      open("/tmp/logo_irr.png", "wb") do |file|
        file.write(resp.body)
      end
    end
    # Указываем этот файл
    self.upload_element.element.set "/tmp/logo_irr.png"
    # Ждём пока появится загруженная фотография
    self.uploaded_photos_element.
         list_item_element(id: "downloaded-photo-1").when_present(30).
         image_element.exists?
  end

  def load_video
    self.add_video_element.when_present.click
    Watir::Wait.until { self.videoPopup_element.exists? }

    self.videoContents_element.when_present.value = <<RUTUBE_VIDEO
      <OBJECT width="470" height="353">
        <PARAM name="movie" value="http://video.rutube.ru/ba83acd900676ba99ef743541430f070"></PARAM>
        <PARAM name="wmode" value="window"></PARAM>
        <PARAM name="allowFullScreen" value="true"></PARAM>
        <EMBED src="http://video.rutube.ru/ba83acd900676ba99ef743541430f070" type="application/x-shockwave-flash" wmode="window" width="470" height="353" allowFullScreen="true" ></EMBED>
      </OBJECT>
RUTUBE_VIDEO

    self.uploadVideoButton
    Watir::Wait.until {self.video_preview?}
  end

  def save
    self.save_element.when_present.click
  end

  def has_package_message
    self.has_package_element.exists?
  end

  def get_package_message
    self.no_package_message_element.when_present.text
  end

  def ensure_section_is_visible(name)
    if self.table_element.element.th(text: name).a.exists?
      self.table_element.element.th(text: name).a.click
    end
  end

end
