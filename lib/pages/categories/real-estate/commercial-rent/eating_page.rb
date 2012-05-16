# encoding: utf-8

class CategoryRealEstateCommercialRentEatingPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/commercial/eating"

  text_field :meters_total_from, :name => "meters-total[from]"
  text_field :meters_total_to, :name => "meters-total[to]"
  text_field :square_hall_from, :name => "square-hall[from]"
  text_field :square_hall_to, :name => "square-hall[to]"
  checkbox :entrance, :name => "entrance"
  checkbox :first_line, :name => "first-line"
  checkbox :equipment, :name => "equipment"

  div :heating, :xpath => "//div[@data-item-name='heating']"
  div :water, :xpath => "//div[@data-item-name='water']"
  
  def set_parameter (hash)
    case hash['parameter']

    when "Общая площадь"
      self.meters_total_from = hash['min']
      self.meters_total_to = hash['max']

    when "Площадь зала"
      self.square_hall_from = hash['min']
      self.square_hall_to = hash['max']

    when "Отдельный вход"
      self.entrance_element.check

    when "1-я линия"
      self.first_line_element.check

    when "Оборудование"
      self.equipment_element.check

    when "Система отопления"
      singleselect(self.heating_element, hash['value'])

    when "Система водоснабжения"
      singleselect(self.water_element, hash['value'])

    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      set_metro_parameter(hash)

    when "Валюта", "Срок сдачи"
      set_rent_parameter(hash)

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "АО", "Район города", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      result = get_metro_parameter(field)

    when "Общая площадь", "Площадь зала", "Система отопления", "Система водоснабжения"
      result = get_unique_parameter(field)

    when "Отдельный вход", "1-я линия", "Оборудование"
      result = get_checkbox_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
