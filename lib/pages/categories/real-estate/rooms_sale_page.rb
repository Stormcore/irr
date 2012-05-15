# encoding: utf-8

class CategoryRealEstateRoomsSalePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/real-estate/rooms-sale"

  div :ao, :xpath => "//div[@data-name='ab_ao']"
  div :district, :xpath => "//div[@data-name='ab_district']"
  div :metro_lane, :xpath => "//div[@data-name='address_metro_lane']"
  div :metro, :xpath => "//div[@data-name='metro']"
  text_field :distance, :name => "distance"
  div :rooms, :xpath => "//div[@data-item-name='rooms-for-sale']"
  text_field :meters_total_from, :name => "meters-total[from]"
  text_field :meters_total_to, :name => "meters-total[to]"
  
  span :show_kitchen_params, :text => 'Квартира'
  text_field :meters_living_from, :name => "meters-living[from]"
  text_field :meters_living_to, :name => "meters-living[to]"
  text_field :kitchen_from, :name => "kitchen[from]"
  text_field :kitchen_to, :name => "kitchen[to]"
  
  span :show_building_params, :text => 'Здание'
  div :floor_house, :xpath => "//div[@data-item-name='floor_house']"
  div :state, :xpath => "//div[@data-item-name='state']"
  checkbox :refuse, :name => "refuse"
  text_field :etage_from, :name => "etage-all[from]"
  text_field :etage_to, :name => "etage-all[to]"
  checkbox :house_lift, :name => "house-lift"
  checkbox :gas, :name => "gas"
  
  # Параметры объявления
  div :ad_content, :xpath => "//div[@class='b-content']"
  span :peshkom, :xpath => "//div[@class='b-adressAdv']/div[@class='txt']/span[@class='gray']"
  
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

    when "Ремонт"
      singleselect(self.state_element, hash['value'])

    when "Отказ получен"
      self.refuse_element.check

    when "Этажей в здании"
      self.show_building_params_element.parent.click unless self.etage_from_element.visible?
      self.etage_from = hash['min']
      self.etage_to = hash['max']

    when "Лифты в здании"
      self.show_building_params_element.parent.click unless self.house_lift_element.visible?
      self.house_lift_element.check

    when "Газ в доме"
      self.show_building_params_element.parent.click unless self.gas_element.visible?
      self.gas_element.check

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "АО", "Район города", "Площадь продажи", "Комнат в квартире", 
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

    when "Отказ получен", "Лифты в здании", "Газ в доме"
      result = get_checkbox_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
