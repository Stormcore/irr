# encoding: utf-8

class CategoryRealEstateOutoftownLandsPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/out-of-town/lands"

  div :land_purpose, :xpath => "//div[@data-item-name='land_purpose']"
  div :land_usage, :xpath => "//div[@data-item-name='land_usage']"
  div :land_law, :xpath => "//div[@data-item-name='land_law']"
  checkbox :gas, :name => "gas"
  checkbox :electricpower, :name => "electricpower"
  text_field :land_from, :name => "land[from]"
  text_field :land_to, :name => "land[to]"

  def set_parameter (hash)
    case hash['parameter']
    when "Категория земли"
      singleselect(self.land_purpose_element, hash['value'])

    when "Вид разрешенного использования"
      singleselect(self.land_usage_element, hash['value'])

    when "Вид права"
      singleselect(self.land_law_element, hash['value'])

    when "Площадь участка"
      self.land_from = hash['min']
      self.land_to = hash['max']

    when "Газ"
      self.gas_element.check

    when "Электричество"
      self.electricpower_element.check

    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      set_metro_parameter(hash)
    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "Категория земли", 
         "Вид разрешенного использования", "Вид права", "Площадь участка"
      result = get_unique_parameter(field)

    when "Газ", "Электричество"
      result = get_checkbox_parameter(field)

    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      set_metro_parameter(hash)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
