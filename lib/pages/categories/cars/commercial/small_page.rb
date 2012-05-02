# encoding: utf-8

class CategoryCarsCommercialSmallPage < AdDetailsPage
  include PageObject

  div :used_or_new, :xpath => "//div[@data-item-name='used-or-new']"
  text_field :car_year_from, :name => "car-year[from]"
  text_field :car_year_to, :name => "car-year[to]"
  div :make, :xpath => "//div[@data-item-name='make']"
  div :model, :xpath => "//div[@data-item-name='model']"
  div :bodytype, :xpath => "//div[@data-item-name='bodytype']"
  div :transmittion, :xpath => "//div[@data-item-name='transmittion']"
  
  text_field :mileage_from, :name => "mileage[from]"
  text_field :mileage_to, :name => "mileage[to]"

  def set_parameter (hash)
    case hash['parameter']

    when "Новый или подержанный"
      multiselect(self.used_or_new_element, hash['value'])

    when "Год выпуска"
      self.car_year_from = hash['min']
      self.car_year_to = hash['max']

    when "Тип кузова"
      multiselect(self.bodytype_element, hash['value'])

    when "Марка"
      multiselect(self.make_element, hash['value'])

    when "Модель"
      multiselect(self.model_element, hash['value'])

    when "Тип трансмиссии"
      multiselect(self.transmittion_element, hash['value'])

    when "Пробег"
      self.mileage_from = hash['min']
      self.mileage_to = hash['max']

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
    when "Пробег"
      # Пробег вводиться в тыс. км, отображается в км.
      # Делим отображаемый результат на 1000 
      result = get_value_parameter(field).to_i / 1000
    when "Марка", "Модель", "Тип кузова", "Тип трансмиссии"
      result = get_unique_parameter(field)
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end