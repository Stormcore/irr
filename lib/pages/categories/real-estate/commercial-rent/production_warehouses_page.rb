# encoding: utf-8

class CategoryRealEstateCommercialRentProductionWarehousesPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/commercial/production-warehouses"

  div :warehouse_type_object, :xpath => "//div[@data-item-name='warehouse_type_object']"
  text_field :square_min_from, :name => "square-min[from]"
  text_field :square_min_to, :name => "square-min[to]"
  text_field :house_ceiling_height, :name => "house-ceiling-height"
  
  checkbox :heating2, :name => "heating2"
  checkbox :security, :name => "security"
  checkbox :railway, :name => "railway"
  text_field :electro_from, :name => "electro[from]"
  text_field :electro_to, :name => "electro[to]"

  def set_parameter (hash)
    case hash['parameter']

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

    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      set_metro_parameter(hash)

    when "Валюта", "Срок сдачи"
      set_rent_parameter(hash)

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "Назначение помещения", "Общая площадь", "Высота потолков",
         "Подключенная мощность"
      result = get_unique_parameter(field)

    when "Отапливаемое", "Охрана", "Ж/д пути"
      result = get_checkbox_parameter(field)

    when "АО", "Район города", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      result = get_metro_parameter(field)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
