# encoding: utf-8

class CategoryRealEstateOutoftownRentPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/real-estate/out-of-town-rent"

  div :ab_area, :xpath => "//div[@data-name='ab_area']"
  div :direction, :xpath => "//div[@data-name='direction']"
  div :shosse, :xpath => "//div[@data-name='shosse']"

  text_field :distance_mkad_from, :name => "distance_mkad[from]"
  text_field :distance_mkad_to, :name => "distance_mkad[to]"
  text_field :house_year_from, :name => "house_year[from]"
  text_field :house_year_to, :name => "house_year[to]"
  text_field :meters_total_from, :name => "meters_total[from]"
  text_field :meters_total_to, :name => "meters_total[to]"
  text_field :rooms_from, :name => "rooms[from]"
  text_field :rooms_to, :name => "rooms[to]"
  text_field :rooms_sleep_from, :name => "rooms_sleep[from]"
  text_field :rooms_sleep_to, :name => "rooms_sleep[to]"
  
  div :walltype, :xpath => "//div[@data-item-name='walltype']"
  checkbox :heating, :name => "heating1"
  checkbox :garage, :name => "garage"
  checkbox :telephone, :name => "telephone"
  checkbox :internet, :name => "internet"
  checkbox :furniture, :name => "furniture"
  checkbox :household, :name => "household"
  div :object, :xpath => "//div[@data-item-name='object']"
  
  # Параметры объявления
  div :ad_content, :xpath => "//div[@class='b-content']"
  div :location, :xpath => "//div[@class='b-adressAdv']/div[@class='h2']"
  
  def set_parameter (hash)
    case hash['parameter']
    when "Расположение"
      multiselect(self.ab_area_element, hash['value'])

    when "Направление"
      multiselect(self.direction_element, hash['value'])

    when "Шоссе"
      multiselect(self.shosse_element, hash['value'])

    when "Удаленность"
      self.distance_mkad_from = hash['min']
      self.distance_mkad_to = hash['max']

    when "Год постройки/сдачи"
      self.house_year_from = hash['min']
      self.house_year_to = hash['max']

    when "Площадь участка"
      self.meters_total_from = hash['min']
      self.meters_total_to = hash['max']

    when "Количество комнат"
      self.rooms_from = hash['min']
      self.rooms_to = hash['max']

    when "Количество спален"
      self.rooms_sleep_from = hash['min']
      self.rooms_sleep_to = hash['max']

    when "Материал стен"
      singleselect(self.walltype_element, hash['value'])

    when "Строение"
      singleselect(self.object_element, hash['value'])

    when "Телефон"
      self.telephone_element.check
    when "Мебель"
      self.furniture_element.check
    when "Бытовая техника"
      self.household_element.check
    when "Интернет"
      self.internet_element.check
    when "Телефон"
      self.telephone_element.check

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "Направление", "Район города", "Общая площадь",
         "Комнат в квартире", "Жилая площадь", "Площадь кухни", "Ремонт"
      result = get_unique_parameter(field)

    when "Расположение"
      result = get_generic_parameter("Регион").split(', ')[1]

    when "Шоссе"
      result = self.location_element.text.split(', ')[0]
      
    when "Удаленность"
      result = self.location_element.text.split(', ')[1].split[0].to_i

    when "Телефон", "Мебель", "Бытовая техника", "Интернет", "Телефон"
      result = get_checkbox_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
