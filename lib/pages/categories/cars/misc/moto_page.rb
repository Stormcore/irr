# encoding: utf-8

class CategoryCarsMiscMotoPage < AdDetailsPage
  include PageObject
  
  div :used_or_new, :xpath => "//div[@data-item-name='used-or-new']"
  text_field :car_year_from, :name => "car-year[from]"
  text_field :car_year_to, :name => "car-year[to]"
  div :make, :xpath => "//div[@data-item-name='make']"
  div :model, :xpath => "//div[@data-item-name='model']"

  def set_parameter (hash)
    case hash['parameter']

    when "Новый или подержанный"
      multiselect(self.used_or_new_element, hash['value'])

    when "Год выпуска"
      self.car_year_from = hash['min']
      self.car_year_to = hash['max']

    when "Марка"
      multiselect(self.make_element, hash['value'])

    when "Модель"
      multiselect(self.model_element, hash['value'])

    when "Источник"
      # TODO: Множественный селект вместо единичного
      multiselect(self.source_from_element, hash['value'])
      
    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Год выпуска"
      result = get_value_parameter(field)
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end