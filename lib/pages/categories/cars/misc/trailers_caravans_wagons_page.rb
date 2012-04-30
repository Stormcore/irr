# encoding: utf-8

class CategoryCarsMiscTrailersCaravansWagonsPage < AdDetailsPage
  include PageObject

  div :offertype, :xpath => "//div[@data-item-name='offertype']"

  div :used_or_new, :xpath => "//div[@data-item-name='used-or-new']"
  text_field :car_year_from, :name => "car-year[from]"
  text_field :car_year_to, :name => "car-year[to]"
  text_field :trunk_value_from, :name => "trunk_value[from]"
  text_field :trunk_value_to, :name => "trunk_value[to]"
  
  def set_parameter (hash)
    case hash['parameter']

    when "Тип предложения"
      singleselect(self.offertype_element, hash['value'])

    when "Новый или подержанный"
      singleselect(self.used_or_new_element, hash['value'])

    when "Год выпуска"
      self.car_year_from = hash['min']
      self.car_year_to = hash['max']

    when "Объем внешнего багажника"
      self.trunk_value_from = hash['min']
      self.trunk_value_to = hash['max']

    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Объем внешнего багажника"
      result = get_unique_parameter(field)
      # Вырезаем литры
      result.gsub!(/ л/, '')
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end