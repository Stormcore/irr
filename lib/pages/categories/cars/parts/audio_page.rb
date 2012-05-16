# encoding: utf-8

class CategoryCarsPartsAudioPage < AdDetailsPage
  include PageObject
  @@getter_functions = Hash.new
  @@setter_functions = Hash.new
  @@url_suffix = "/cars/parts/audio"
  alias get_parameter get_generic_parameter
end
