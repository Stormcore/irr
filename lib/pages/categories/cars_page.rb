# encoding: utf-8

class CategoryCarsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/"

  # Page layout
  div :dealers_section, :class => "b-dillers"
  unordered_list :dealers, :xpath => "//div[@class='b-blockInf b-dillers']/div[@class='b-body']/ul"
  link :all_dealers, :xpath => "//div[@class='b-blockInf b-dillers']/div[@class='b-body']/div[@class='b-bottom']/a"

  # Search parameters
  text_field :car_year_from, :name => "car-year[from]"
  text_field :car_year_to, :name => "car-year[to]"

  div :make, :xpath => "//div[@data-item-name='make']"
  div :model, :xpath => "//div[@data-item-name='model']"

  div :bodytype, :xpath => "//div[@data-item-name='bodytype']"
  div :turbo, :xpath => "//div[@data-item-name='turbo']"
  div :gear, :xpath => "//div[@data-item-name='gear']"
  div :transmittion, :xpath => "//div[@data-item-name='transmittion']"

  text_field :mileage_from, :name => "mileage[from]"
  text_field :mileage_to, :name => "mileage[to]"

  def get_dealer_info(index)
    
  end
  
  def set_parameter (hash)
    case hash['parameter']

    when "Год выпуска"
      self.car_year_from = hash['min']
      self.car_year_to = hash['max']

    when "Марка"
      multiselect(self.make_element, hash['value'])

    when "Модель"
      multiselect(self.model_element, hash['value'])
      
    when "Тип кузова"
      multiselect(self.bodytype_element, hash['value'])
    
    when "Тип двигателя"
      multiselect(self.turbo_element, hash['value'])
      
    when "Тип привода"
      multiselect(self.gear_element, hash['value'])
      
    when "Тип трансмиссии"
      multiselect(self.transmittion_element, hash['value'])
      
    when "Пробег"
      self.mileage_from = hash['min']
      self.mileage_to = hash['max']

    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Год выпуска"
      result = get_value_parameter(field)
    when "Пробег"
      # Пробег вводиться в тыс. км, отображается в км.
      # Делим отображаемый результат на 1000 
      result = get_value_parameter(field).to_i / 1000
    when "Марка", "Модель", "Тип кузова", "Тип двигателя", "Привод", "Тип трансмиссии"
      result = get_unique_parameter(field)
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end

class Dealer
  def initialize(element)
    @element = element.div_element(:class => "wrap").
      div_element(:class => "hid-o")
  end

  def get_thumbnail_url
    @element.div_element(:class => "wrImage").
      image_element.attribute("src")
  end

  def get_dealer_name
    @element.paragraph_element(:class => "h3").
      link_element.text
  end

  def get_dealer_url
    @element.paragraph_element(:class => "h3").
      link_element.attribute("href")
  end
end
