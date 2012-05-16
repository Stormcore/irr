# encoding: utf-8

class CategoryCarsPartsPassengerPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/passenger"

  irr_multi_select "Марка", "make"

  def set_parameter (hash)
    if @@setter_functions.has_key?(hash['parameter'])
      self.send "#{@@setter_functions[hash['parameter']]}", hash
    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    self.send("#{@@getter_functions[field]}")
  end
end
