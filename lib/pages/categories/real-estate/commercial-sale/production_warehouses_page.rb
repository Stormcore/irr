# encoding: utf-8

class CategoryRealEstateCommercialsaleProductionWarehousesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/real-estate/commercial-sale/production-warehouses"

  div :ao, :xpath => "//div[@data-name='ab_ao']"
  div :district, :xpath => "//div[@data-name='ab_district']"
  div :metro_lane, :xpath => "//div[@data-name='address_metro_lane']"
  div :metro, :xpath => "//div[@data-name='metro']"
  text_field :distance, :name => "distance"

  div :warehouse_type_object, :xpath => "//div[@data-item-name='warehouse_type_object']"
  text_field :square_min_from, :name => "square-min[from]"
  text_field :square_min_to, :name => "square-min[to]"
  text_field :house_ceiling_height, :name => "house-ceiling-height"
  
  checkbox :heating2, :name => "heating2"
  checkbox :security, :name => "security"
  checkbox :railway, :name => "railway"
  text_field :electro_from, :name => "electro[from]"
  text_field :electro_to, :name => "electro[to]"
  
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

    when "Назначение помещения"
      singleselect(self.warehouse_type_object_element, hash['value'])

    when "Общая площадь"
      self.square_min_from = hash['min']
      self.square_min_to = hash['max']

    when "Высота потолков"
      self.house_ceiling_height = hash['value']

    when "Отапливаемое"
      self.heating2_element.check

    when "Охрана"
      self.security_element.check

    when "Ж/д пути"
      self.railway_element.check

    when "Подключенная мощность"
      self.electro_from = hash['min']
      self.electro_to = hash['max']

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "АО", "Район города", "Назначение помещения", "Общая площадь", 
         "Высота потолков", "Подключенная мощность"
      result = get_unique_parameter(field)

    when "Линия метро"
      hidden_comment = self.ad_content_element.element.html.scan(/HIDDEN ADDRESSES(.*)-->/m)
      metro_and_region = hidden_comment[0][0].split("\n")[2].strip.split(', ')[0]
      result = metro_and_region.split[0]

    when "Станция метро"
      result = self.metro_station.split(', ')[0]

    when "До метро"
      begin
        result = self.peshkom_element.text.split[0].to_i
      rescue Watir::Exception::UnknownObjectException
        result = 0
      end

    when "Отапливаемое", "Охрана", "Ж/д пути"
      result = get_checkbox_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
