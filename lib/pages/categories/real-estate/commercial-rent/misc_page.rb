# encoding: utf-8

class CategoryRealEstateCommercialRentMiscPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent
  @@getter_functions = Hash.new
  @@setter_functions = Hash.new
  @@url_suffix = "/real-estate/commercial/misc"

  text_field :meters_total_from, :name => "square-min[from]"
  text_field :meters_total_to, :name => "square-min[to]"
  div :state, :xpath => "//div[@data-item-name='state']"
  checkbox :first_line, :name => "first-line"
  checkbox :entrance, :name => "entrance"
  
  def set_parameter (hash)
    case hash['parameter']
    when "Общая площадь"
      self.meters_total_from = hash['min']
      self.meters_total_to = hash['max']

    when "Ремонт"
      singleselect(self.state_element, hash['value'])

    when "1-я линия"
      self.first_line_element.check

    when "Отдельный вход"
      self.entrance_element.check

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

    when "Общая площадь", "Ремонт"
      result = get_unique_parameter(field)

    when "1-я линия", "Отдельный вход"
      result = get_checkbox_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
