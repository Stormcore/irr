# encoding: utf-8

class CategoryCarsMiscSnowPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/snow"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Источник", "sourcefrom"

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
