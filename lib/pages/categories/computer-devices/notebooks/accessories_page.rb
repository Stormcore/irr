# encoding: utf-8

class CategoryComputerDevicesNotebooksAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/notebooks/accessories/"

  def get_parameter (field)
    get_generic_parameter(field)
  end
end
