# encoding: utf-8

class CategoryRealEstateOutoftownLandsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/real-estate/out-of-town/lands"

  div :ao, :xpath => "//div[@data-name='ab_ao']"
  div :district, :xpath => "//div[@data-name='ab_district']"
  div :metro_lane, :xpath => "//div[@data-name='address_metro_lane']"
  div :metro, :xpath => "//div[@data-name='metro']"
  text_field :distance, :name => "distance"

  div :land_purpose, :xpath => "//div[@data-item-name='land_purpose']"
  div :land_usage, :xpath => "//div[@data-item-name='land_usage']"
  div :land_law, :xpath => "//div[@data-item-name='land_law']"
  checkbox :gas, :name => "gas"
  checkbox :electricpower, :name => "electricpower"
  text_field :land_from, :name => "land[from]"
  text_field :land_to, :name => "land[to]"

  
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

    when "Категория земли"
      singleselect(self.land_purpose, hash['value'])

    when "Вид разрешенного использования"
      singleselect(self.land_usage, hash['value'])

    when "Вид права"
      singleselect(self.land_law, hash['value'])

    when "Площадь участка"
      self.land_from = hash['min']
      self.land_to = hash['max']

    when "Газ"
      self.gas_element.check

    when "Электричество"
      self.electricpower_element.check

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "АО", "Район города", "Категория земли", 
         "Вид разрешенного использования", "Вид права", "Площадь участка"
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

    when "Газ", "Электричество"
      result = get_checkbox_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
