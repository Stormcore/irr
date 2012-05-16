# encoding: utf-8
module CityWithMetro
  include PageObject
  
  div :ao, :xpath => "//div[@data-name='ab_ao']"
  div :district, :xpath => "//div[@data-name='ab_district']"
  div :microdistrict, :xpath => "//div[@data-name='ab_microdistrict']"
  div :metro_lane, :xpath => "//div[@data-name='address_metro_lane']"
  div :metro, :xpath => "//div[@data-name='metro']"
  text_field :distance, :name => "distance"
  span :peshkom, :xpath => "//div[@class='b-adressAdv']/div[@class='txt']/span[@class='gray']"
  
  def set_metro_parameter(hash)
    case hash['parameter']
    when "Округ"
      multiselect(self.ao_element, hash['value'])

    when "Район"
      multiselect(self.district_element, hash['value'])

    when "Микрорайон"
      multiselect(self.district_element, hash['value'])

    when "Линия метро"
      multiselect(self.metro_lane_element, hash['value'])

    when "Станция метро"
      multiselect(self.metro_element, hash['value'])

    when "До метро"
      self.distance = hash['value']
    end
  end
  
  def get_metro_parameter(field)
    case field
    when "АО", "Район города", "Микрорайон"
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
    end
    result
  end
  
end