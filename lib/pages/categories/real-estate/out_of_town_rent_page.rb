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
  span :distance, :xpath => "//div[@class='b-adressAdv']/div[@class='txt']/span[@class='gray']"
  
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

    when "Комнат в квартире"
      multiselect_inline(self.rooms_element, hash['value'])

    when "Общая площадь"
      self.meters_total_from = hash['min']
      self.meters_total_to = hash['max']

    when "Жилая площадь"
      unless self.meters_living_from_element.visible?
        self.show_kitchen_params_element.parent.click
      end
      self.meters_living_from = hash['min']
      self.meters_living_to = hash['max']

    when "Площадь кухни"
      unless self.kitchen_from_element.visible?
        self.show_kitchen_params_element.parent.click
      end
      self.kitchen_from = hash['min']
      self.kitchen_to = hash['max']

    when "Этаж"
      multiselect(self.floor_house_element, hash['value'])

    when "Ремонт"
      singleselect(self.state_element, hash['value'])

    when "Телефон"
      self.telephone_element.check
    when "Мебель"
      self.furniture_element.check
    when "Бытовая техника"
      self.household_element.check


    when "Этаж в здании"
      self.etage_from = hash['min']
      self.etage_to = hash['max']

    when "Лифты в здании"
      self.house_lift_element.check

    when "Газ в доме"
      self.gas_element.check

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "АО", "Район города", "Общая площадь", "Комнат в квартире", 
         "Жилая площадь", "Площадь кухни", "Ремонт"
      result = get_unique_parameter(field)
    when "Линия метро"
      hidden_comment = self.ad_content_element.element.html.scan(/HIDDEN ADDRESSES(.*)-->/m)
      metro_and_region = hidden_comment[0][0].strip.split(', ')[0]
      result = metro_and_region.split[0]

    when "Станция метро"
      hidden_comment = self.ad_content_element.element.html.scan(/HIDDEN ADDRESSES(.*)-->/m)
      metro_and_region = hidden_comment[0][0].strip.split(', ')[1]
      result = metro_and_region.split[0]

    when "До метро"
      begin
        result = self.peshkom_element.text.split[0].to_i
      rescue Watir::Exception::UnknownObjectException
        result = 0
      end

    when "Телефон", "Мебель", "Бытовая техника", "Лифты в здании",
         "Газ в доме"
      result = get_checkbox_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
