# encoding: utf-8

class CategoryCarsRepaymentSearchPage < AdDetailsPage
  include PageObject
  
  div :type, :xpath => "//div[@data-item-name='type']"
  div :condition, :xpath => "//div[@data-item-name='condition']"
  div :madein, :xpath => "//div[@data-item-name='madein']"
  
  def set_parameter (hash)
    case hash['parameter']
    when "Тип автомобиля"
      multiselect(self.type_element, hash['value'])

    when "Состояние"
      multiselect(self.condition_element, hash['value'])

    when "Автомобили"
      multiselect(self.madein_element, hash['value'])

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "Состояние", "Автомобили"
      result = get_unique_parameter(field)
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end