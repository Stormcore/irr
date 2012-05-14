# encoding: utf-8

class CategoryRealEstateCommercialRentMiscPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/real-estate/commercial/misc"

  div :ao, :xpath => "//div[@data-name='ab_ao']"
  div :district, :xpath => "//div[@data-name='ab_district']"
  div :metro_lane, :xpath => "//div[@data-name='address_metro_lane']"
  div :metro, :xpath => "//div[@data-name='metro']"
  text_field :distance, :name => "distance"

  text_field :meters_total_from, :name => "meters-total[from]"
  text_field :meters_total_to, :name => "meters-total[to]"
  div :state, :xpath => "//div[@data-name='state']"
  checkbox :first_line, :name => "first-line"
  checkbox :parking, :name => "parking"
  
  # Параметры объявления
  div :ad_content, :xpath => "//div[@class='b-content']"
  span :metro_station, :xpath => "//div[@class='b-adressAdv']/div[@class='txt']"
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

    when "Ремонт"
      multiselect(self.state_element, hash['value'])

    when "1-я линия"
      self.first_line_element.check

    when "Парковка"
      self.parking_element.check

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "АО", "Район города", "Общая площадь", "Ремонт"
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

    when "1-я линия", "Парковка"
      result = get_checkbox_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
