# encoding: utf-8

class CategoryCarsServicesLoansPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/loans"

  irr_single_select "Тип предложения", "offertype"

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
