# encoding: utf-8

class CategoryRealEstateCommercialsaleOfficesPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/commercial-sale/offices"

  text_field :square_min_from, :name => "square-min[from]"
  text_field :square_min_to, :name => "square-min[to]"
  div :state, :xpath => "//div[@data-item-name='state']"
  
  checkbox :first_line, :name => "first-line"
  checkbox :entrance, :name => "entrance"
  checkbox :house_lift, :name => "house-lift"
  checkbox :security, :name => "security"
  text_field :house_ceiling_height, :name => "house-ceiling-height"
  
  def set_parameter (hash)
    case hash['parameter']

    when "Назначение помещения"
      singleselect(self.state, hash['value'])

    when "Общая площадь"
      self.square_min_from = hash['min']
      self.square_min_to = hash['max']

    when "Ремонт"
      singleselect(self.state_element, hash['value'])

    when "1-я линия"
      self.first_line_element.check

    when "Отдельный вход"
      self.entrance_element.check

    when "Лифты в здании"
      self.house_lift_element.check

    when "Охрана здания"
      self.house_lift_element.check

    when "Высота потолков"
      self.house_ceiling_height_element.check

    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      set_metro_parameter(hash)

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "Общая площадь", "Ремонт", "Высота потолков"
      result = get_unique_parameter(field)

    when "1-я линия", "Отдельный вход", "Лифты в здании", "Охрана здания"
      result = get_checkbox_parameter(field)

    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      set_metro_parameter(hash)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
