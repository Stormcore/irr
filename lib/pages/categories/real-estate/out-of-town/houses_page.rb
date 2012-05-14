# encoding: utf-8

class CategoryRealEstateOutoftownHousesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/real-estate/out-of-town/houses"

  div :ao, :xpath => "//div[@data-name='ab_ao']"
  div :district, :xpath => "//div[@data-name='ab_district']"
  div :metro_lane, :xpath => "//div[@data-name='address_metro_lane']"
  div :metro, :xpath => "//div[@data-name='metro']"
  text_field :distance, :name => "distance"
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

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "АО", "Район города", "Площадь строения", "Год постройки/сдачи", 
         "Площадь участка", "Количество этажей", "Количество комнат", 
         "Материал стен", "Строение", "Ремонт"
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

    when "Лифты в здании", "Отапливаемый"
      result = get_checkbox_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
