# encoding: utf-8

class CategoryRealEstateCommercialsaleEatingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/real-estate/commercial-sale/eating"

  div :ao, :xpath => "//div[@data-name='ab_ao']"
  div :district, :xpath => "//div[@data-name='ab_district']"
  div :metro_lane, :xpath => "//div[@data-name='address_metro_lane']"
  div :metro, :xpath => "//div[@data-name='metro']"
  text_field :distance, :name => "distance"

  text_field :meters_total_from, :name => "meters-total[from]"
  text_field :meters_total_to, :name => "meters-total[to]"
  text_field :square_hall_from, :name => "square-hall[from]"
  text_field :square_hall_to, :name => "square-hall[to]"
  checkbox :entrance, :name => "entrance"
  checkbox :first_line, :name => "first-line"
  checkbox :equipment, :name => "equipment"

  div :heating, :xpath => "//div[@data-name='heating']"
  div :water, :xpath => "//div[@data-name='water']"
  
  # Параметры объявления
  div :ad_content, :xpath => "//div[@class='b-content']"
  div :metro_station, :xpath => "//div[@class='b-adressAdv']/div[@class='txt']"
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

    when "Общая площадь"
      self.meters_total_from = hash['min']
      self.meters_total_to = hash['max']

    when "Площадь зала"
      self.square_hall_from = hash['min']
      self.square_hall_to = hash['max']

    when "Отдельный вход"
      self.entrance_element.check

    when "1-я линия"
      self.first_line_element.check

    when "Оборудование"
      self.equipment_element.check

    when "Система отопления"
      singleselect(self.heating_element, hash['value'])

    when "Система водоснабжения"
      singleselect(self.water_element, hash['value'])

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "АО", "Район города", "Общая площадь", "Площадь зала",
         "Система отопления", "Система водоснабжения"
      result = get_unique_parameter(field)

    when "Линия метро"
      hidden_comment = self.ad_content_element.element.html.scan(/HIDDEN ADDRESSES(.*)-->/m)
      metro_and_region = hidden_comment[0][0].split("\n")[2].strip.split(', ')[0]
      result = metro_and_region.split[0]

    when "Станция метро"
      result = self.metro_station.text

    when "До метро"
      begin
        result = self.peshkom_element.text.split[0].to_i
      rescue Watir::Exception::UnknownObjectException
        result = 0
      end

    when "Отдельный вход", "1-я линия", "Оборудование"
      result = get_checkbox_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
