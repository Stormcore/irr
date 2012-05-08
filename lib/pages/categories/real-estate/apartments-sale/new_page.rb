# encoding: utf-8

class CategoryRealEstateApartmentsSaleNewPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/real-estate/apartments-sale/new"

  div :ao, :xpath => "//div[@data-name='ab_ao']"
  div :district, :xpath => "//div[@data-name='ab_district']"
  div :metro_lane, :xpath => "//div[@data-name='address_metro_lane']"
  div :metro, :xpath => "//div[@data-name='metro']"
  text_field :distance, :name => "distance"
  div :rooms, :xpath => "//div[@data-item-name='rooms']"
  text_field :meters_total_from, :name => "meters-total[from]"
  text_field :meters_total_to, :name => "meters-total[to]"
  
  span :show_kitchen_params, :xpath => "//a[@class='ev_hide'][0]"
  text_field :meters_living_from, :name => "meters-living[from]"
  text_field :meters_living_to, :name => "meters-living[to]"
  text_field :kitchen_from, :name => "kitchen[from]"
  text_field :kitchen_to, :name => "kitchen[to]"
  
  div :floor_house, :xpath => "//div[@data-item-name='floor_house']"
  checkbox :private, :name => "private"
  div :state, :xpath => "//div[@data-item-name='state']"
  checkbox :balcony, :name => "balcony"
  text_field :etage_from, :name => "etage-all[from]"
  text_field :etage_to, :name => "etage-all[to]"
  checkbox :house_lift, :name => "house-lift"
  checkbox :gas, :name => "gas"
  
  # Параметры объявления
  div :ad_content, :xpath => "//div[@class='b-content']"
  
  def set_parameter (hash)
    case hash['parameter']
    when "Округ"
      multiselect(self.ao_element, hash['value'])

    when "Район"
      multiselect(self.district_element, hash['value'])

    when "Линия метро"
      multiselect(self.metro_lane_element, hash['value'])

    when "Станция метро"
      multiselect(self.metro_element, hash['value'])

    when "До метро"
      self.distance = hash['value']

    when "Комнат в квартире"
      multiselect_inline(self.rooms_element, hash['value'])

    when "Общая площадь"
      self.meters_total_from = hash['min']
      self.meters_total_to = hash['max']

    when "Жилая площадь"
      self.meters_living_from = hash['min']
      self.meters_living_to = hash['max']

    when "Площадь кухни"
      self.kitchen_from = hash['min']
      self.kitchen_to = hash['max']

    when "Этаж"
      multiselect(self.floor_house_element, hash['value'])

    when "Приватизированная квартира"
      self.private_element.check

    when "Отделка"
      singleselect(self.state_element, hash['value'])

    when "Балкон/Лоджия"
      self.balcony_element.check

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
    when "АО", "Район города", "Станция метро",
         "До метро", "Общая площадь", "Балкон/Лоджия", "Лифты в здании", 
         "Газ в доме"
      result = get_unique_parameter(field)
    when "Линия метро"
      hidden_comment = self.ad_content_element.element.html.scan(/HIDDEN ADDRESSES(.*)-->/m)
      metro_and_region = hidden_comment[0][0].strip.split(', ')[0]
      result = metro_and_region.split()[0]
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
