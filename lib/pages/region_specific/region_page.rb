# encoding: utf-8

module Regions
  include PageObject

  irr_multi_select "Регион",        "ab_area", "Расположение"
  irr_multi_select "Направление",   "direction"
  irr_multi_select "Шоссе",         "shosse"
  irr_range_select "Удаленность",   "distance_mkad"
  
  def set_regions_parameter(hash)
    setter_functions = Regions.instance_variable_get(:@setter_functions)
    self.send "#{setter_functions[hash['parameter']]}", hash
  end
  
  def get_regions_parameter(field)
    case field
    when "Шоссе"
      self.send("#{Regions.instance_variable_get(:@getter_functions)[field]}").split(', ')[0]
    when "Регион"
      self.send("#{Regions.instance_variable_get(:@getter_functions)[field]}").split(', ')[1]
    when "Удаленность"
      self.send("#{Regions.instance_variable_get(:@getter_functions)[field]}").split(', ')[1].split[0].to_i
    end
  end
end
