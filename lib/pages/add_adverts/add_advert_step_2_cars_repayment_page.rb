# encoding: utf-8
load "#{File.dirname(__FILE__)}/add_advert_step_2_page.rb"

class AddAdvertStep2CarsRepayment < AddAdvertStep2

  text_field :address_city, :name => "address_city"
  text_field :title, :name => "title"
  text_field :price, :name => "price"
  select_list :currency, :name => "currency"
  select_list :auto_type, :name => "type"
  select_list :condition, :name => "condition"
  select_list :madein, :name => "madein"
  text_area :text, :name => "text"

  def set_value(key, value)
    case key
    when "Населённый пункт"
      self.address_city = value
      #confirmation
      self.link_element(:class => "ui-corner-all").when_present.click
    when "Заголовок"
      self.title = value
    when "Цена"
      self.price = value
    when "Валюта"
      self.currency = value
    when "Тип автомобиля"
      self.auto_type = value
    when "Состояние"
      self.condition = value
    when "Автомобили"
      self.madein = value
    when "Текст объявления"
      self.text = value
    end
  end
end
