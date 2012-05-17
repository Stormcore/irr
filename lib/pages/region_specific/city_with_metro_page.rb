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

  def get_metro_parameter(field)
    case field   
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
