# encoding: utf-8

class CategoryCarsMiscOtherPage < AdDetailsPage
  include PageObject
  @@getter_functions = Hash.new
  @@setter_functions = Hash.new
  @@url_suffix = "/cars/misc/other"
  
  alias get_parameter get_generic_parameter
end
