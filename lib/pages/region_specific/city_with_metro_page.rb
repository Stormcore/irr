# encoding: utf-8

module CityWithMetro
  include PageObject
  
  irr_multi_select "АО",            "ab_ao", "Округ"
  irr_multi_select "Район города",  "ab_district", "Район"
  irr_multi_select "Микрорайон",    "ab_microdistrict"
  irr_multi_select "Линия метро",   "address_metro_lane"
  irr_multi_select "Станция метро", "metro"
  irr_text_field   "До метро",      "distance"
  span :peshkom, :xpath => "//div[@class='b-adressAdv']/div[@class='txt']/span[@class='gray']"

  def set_metro_parameter(hash)
    setter_functions = CityWithMetro.instance_variable_get(:@setter_functions)
    self.send "#{setter_functions[hash['parameter']]}", hash
  end

  def get_metro_parameter(field)
    case field
    when "АО", "Район города", "Микрорайон"
      getter_functions = CityWithMetro.instance_variable_get(:@getter_functions)
      result = self.send "#{getter_functions[field]}"
    
    when "Линия метро"
      hidden_comment = self.ad_content_element.when_present.element.html.scan(/HIDDEN ADDRESSES(.*)-->/m)
      metro_and_region = hidden_comment[0][0].strip.split(', ')[0]
      result = metro_and_region.split[0]

    when "Станция метро"
      hidden_comment = self.ad_content_element.when_present.element.html.scan(/HIDDEN ADDRESSES(.*)-->/m)
      metro_and_region = hidden_comment[0][0].strip.split(', ')[1]
      result = metro_and_region.split[0]

    when "До метро"
      begin
        result = self.peshkom_element.when_present.text.split[0].to_i
      rescue Watir::Wait::TimeoutError
        result = 0
      end
    end
    result
  end
end
