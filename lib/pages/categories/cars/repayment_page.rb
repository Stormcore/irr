# encoding: utf-8

class CategoryCarsRepaymentSearchPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/repayment"

  irr_multi_select "Тип автомобиля", "type"
  irr_multi_select "Состояние", "condition"
  irr_multi_select "Автомобили", "madein"

  def set_parameter (hash)
    if @@setter_functions.has_key?(hash['parameter'])
      self.send "#{@@setter_functions[hash['parameter']]}", hash
    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    if @@getter_functions.has_key?(field)
      self.send("#{@@getter_functions[field]}")
    else
      get_generic_parameter(field)
    end
  end
end
