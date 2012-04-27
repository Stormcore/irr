# encoding: utf-8
load "#{File.dirname(__FILE__)}/add_advert_step_2_page.rb"

class AddAdvertStep2AddMoto < AddAdvertStep2

  text_field  :address_city, :name => "address_city"
  text_field  :Цена, :name => "price"
  select_list :Валюта, :name => "currency"
  
  select_list :Марка, :name => "make"
  select_list :Модель, :name => "model"
  text_field  :Модификация, :name => "modification"
  select_list :Типпредложения, :name => "offertype"
  select_list :Новыйилиподержанный, :name => "used-or-new"
  select_list :Страна, :name => "country"
  select_list :Годвыпуска, :name => "car-year"
  select_list :Класстип, :name => "moto_class"
  checkbox    :Битыйавтомобиль, :name => "brokeauto"
  
  text_area :Текстобъявления, :name => "text"

  def set_value(key,value)
    case key
    when "Населённый пункт"
      self.address_city = value
      #confirmation
      self.link_element(:class => "ui-corner-all").when_present.click
    when "Битый автомобиль"
      self.Битыйавтомобиль.check if value.to_lowercase == "да"
    else
      eval("self.#{key.gsub(' ','').gsub('/', '')} = value")
    end
  end
end
