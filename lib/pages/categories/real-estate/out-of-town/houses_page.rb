# encoding: utf-8

class CategoryRealEstateOutoftownHousesPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  
  @@url_suffix = "/real-estate/out-of-town/houses"

  text_field :meters_total_from, :name => "meters-total[from]"
  text_field :meters_total_to, :name => "meters-total[to]"
  text_field :house_year_from, :name => "house-year[from]"
  text_field :house_year_to, :name => "house-year[to]"
  text_field :land_from, :name => "land[from]"
  text_field :land_to, :name => "land[to]"
  text_field :etage_from, :name => "etage-all[from]"
  text_field :etage_to, :name => "etage-all[to]"
  div :rooms, :xpath => "//div[@data-item-name='rooms']"
  checkbox :gas, :name => "gas"
  checkbox :heating, :name => "heating1"
  div :walltype, :xpath => "//div[@data-item-name='walltype']"
  div :object, :xpath => "//div[@data-item-name='object']"
  div :state, :xpath => "//div[@data-item-name='state']"

  def set_parameter (hash)
    case hash['parameter']
    when "Площадь строения"
      self.meters_total_from = hash['min']
      self.meters_total_to = hash['max']

    when "Год постройки/сдачи"
      self.house_year_from = hash['min']
      self.house_year_to = hash['max']

    when "Площадь участка"
      self.land_from = hash['min']
      self.land_to = hash['max']

    when "Количество этажей"
      self.etage_from = hash['min']
      self.etage_to = hash['max']

    when "Количество комнат"
      multiselect_inline(self.rooms_element, hash['value'])

    when "Газ в доме"
      self.gas_element.check

    when "Отапливаемый"
      self.heating_element.check

    when "Материал стен"
      singleselect(self.walltype_element, hash['value'])

    when "Строение"
      multiselect(self.object_element, hash['value'])

    when "Ремонт"
      singleselect(self.state_element, hash['value'])

    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      set_metro_parameter(hash)
    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "Площадь строения", "Год постройки/сдачи", 
         "Площадь участка", "Количество этажей", "Количество комнат", 
         "Материал стен", "Строение", "Ремонт"
      result = get_unique_parameter(field)

    when "Лифты в здании", "Отапливаемый"
      result = get_checkbox_parameter(field)

    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      set_metro_parameter(hash)
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
