# encoding: utf-8

class CategoryCarsPartsAudioPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/audio"
  alias get_parameter get_generic_parameter
end
