# encoding: utf-8

class CategoryCarsPartsAudioPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/audio"

  def get_parameter (field)
    get_generic_parameter(field) 
  end
end
