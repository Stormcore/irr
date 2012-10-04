# encoding: utf-8
class AdDetailsPage
  include PageObject

  div :title, class: "title"
  div :price, class: "price"
  div :fields, class: "cBlock"
  div :description, class: "fromSeller"
  div :contact_info, class: "contactInfo"

  def get_title
    self.title_element.when_present.text rescue nil
  end

  def get_price currency
    self.price_element.element.spans.find {|s|
         s.html.gsub("&nbsp;",'').gsub(/<(\/|)span>/,'').include?(" #{currency}")
    }.html.gsub("&nbsp;",'').gsub(/<(\/|)span>/,'').gsub(" #{currency}", '') rescue nil
  end

  def get_description
    self.description_element.paragraph_element.text rescue nil
  end

  def get_contact_person
    self.contact_info_element.element.trs.find {|tr| 
      tr.td(text: "Контактное лицо:").exists?
    }.td(index: 1).text rescue nil
  end

  def get_contact_phone
    self.contact_info_element.element.trs.find {|tr| 
      tr.td(text: "Телефон:").exists?
    }.td(index: 1).text rescue nil
  end

  def get_custom_field field
    self.fields_element.div_element(class: "col2").table_element.element.
         trs.find {|tr| tr.td(text: field).exists?}.td(index: 1).text rescue nil
  end

  def get_all_fields
     fields = self.fields_element.div_element(class: "col2").table_element.element.
          trs.map {|tr| [tr.td.text, tr.td(index: 1).text]}
     fields << ['Заголовок', self.get_title.gsub("­",'')]
     fields << ['Описание', self.get_description]
     fields << ['Контактное лицо', self.get_contact_person]
     phone = self.get_contact_phone
     fields << ['Контактный телефон', phone] unless phone.nil?
     fields
  end

  def get_value field, parameter=nil
    case field
    when "Заголовок"
      self.get_title
    when /Цена/
      self.get_price parameter
    when "Описание"
      self.get_description
    when "Контактное лицо"
      self.get_contact_person
    when "Контактный телефон"
      self.get_contact_phone
    else
      self.get_custom_field field
    end
  end
end
