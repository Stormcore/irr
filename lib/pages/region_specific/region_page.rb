# encoding: utf-8

module Regions
  include PageObject

  irr_multi_select "Регион",        "ab_area", "Расположение", "mainParams"
  irr_multi_select "Направление",   "direction"
  irr_multi_select "Шоссе",         "shosse"
  irr_range_select "Удаленность",   "distance_mkad"
  
  div :adress, :class => "b-adressAdv"
  
  def set_regions_parameter(hash)
    setter_functions = Regions.instance_variable_get(:@setter_functions)
    self.send "#{setter_functions[hash['parameter']]}", hash
  end
  
  def get_regions_parameter(field)
    case field
    when "Регион"
      self.send("#{Regions.instance_variable_get(:@getter_functions)[field]}").split(', ')[1]
    when "Направление"
      getter_functions = Regions.instance_variable_get(:@getter_functions)
      self.send "#{getter_functions[field]}"
    when "Шоссе"
      self.adress_element.div_element(:class => "h2").text.split(', ')[0]
    when "Удаленность"
      self.adress_element.div_element(:class => "h2").text.split(', ')[1]
    end
  end
end
