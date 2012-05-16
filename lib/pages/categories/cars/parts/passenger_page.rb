# encoding: utf-8

class CategoryCarsPartsPassengerPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/passenger"

  irr_multi_select "Марка", "make"

end
