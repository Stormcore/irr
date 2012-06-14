# encoding: utf-8
class AddAdvertStep2 < AdDetailsPage
  include PageObject

  link :region_spoiler, :name => "region_link"
  select_list :region, :id => "fr-region"
  text_field  :address_city, :name => "address_city"

  text_field :f_title, :id => "f_title"
  text_field :f_text, :id => "f_text"

  link :save, :id => "submit-edit-form"
  link :next_step, :id => "next_link"

  def set_region(region)
    self.region_spoiler_element.when_present.click
    self.region_element.when_present.visible?.should == true
    self.region = region
  end

  def set_city(city)
    self.address_city = city
    self.link_element(:class => "ui-corner-all").when_present.click
  end

  def set_value_for_custom(control, hash)
    # По типу следующего контрола устанавливаем значение
    case control.tag_name
    when "select"
      # Комбобокс
      self.select_list_element(:id => control.id).select hash["value"]
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
    begin
      label = self.div_element(:text => /#{hash['parameter']}/, :class => "lbl")
      control = label.element.elements(:xpath => "following-sibling::*")[0]
      set_value_for_custom(control, hash)
    rescue Watir::Exception::UnknownObjectException => e
      # Нет такого элемента - checkbox
      self.checkbox_element(:xpath => "//label[contains(.,'#{hash['parameter']}')]/input").check
    end
  end

  def set_parameter(hash)
    case hash['parameter']
    when "Регион"
      self.set_region hash['value']
    when "Населённый пункт"
      self.set_city hash['value']
    when "Заголовок"
      self.f_title = hash['value']
    when "Текст"
      self.f_text = hash['value']
    else
      self.set_custom_parameter(hash)
    end
  end

  def save
    self.save_element.when_present.click
  end

end
