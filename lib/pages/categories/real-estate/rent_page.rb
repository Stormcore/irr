# encoding: utf-8

class CategoryRealEstateRentPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/rent"

  div :rooms, :xpath => "//div[@data-item-name='rooms']"
  text_field :meters_total_from, :name => "meters-total[from]"
  text_field :meters_total_to, :name => "meters-total[to]"
  
  span :show_kitchen_params, :text => 'Площадь Жилая/Кухня'
  text_field :meters_living_from, :name => "meters-living[from]"
  text_field :meters_living_to, :name => "meters-living[to]"
  text_field :kitchen_from, :name => "kitchen[from]"
  text_field :kitchen_to, :name => "kitchen[to]"
  
  div :floor_house, :xpath => "//div[@data-item-name='floor_house']"
  div :state, :xpath => "//div[@data-item-name='state']"
  checkbox :telephone, :name => "telephone"
  checkbox :furniture, :name => "furniture"
  checkbox :household, :name => "household"
  text_field :etage_from, :name => "etage-all[from]"
  text_field :etage_to, :name => "etage-all[to]"
  checkbox :house_lift, :name => "house-lift"
  checkbox :gas, :name => "gas"
  
  def set_parameter (hash)
    case hash['parameter']
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
    when "Общая площадь", "Комнат в квартире", 
         "Жилая площадь", "Площадь кухни", "Ремонт"
      result = get_unique_parameter(field)

    when "Телефон", "Мебель", "Бытовая техника", "Лифты в здании",
         "Газ в доме"
      result = get_checkbox_parameter(field)

    when "АО", "Район города", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      result = get_metro_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
