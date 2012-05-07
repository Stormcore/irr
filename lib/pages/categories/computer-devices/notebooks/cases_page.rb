# encoding: utf-8

class CategoryComputerDevicesNotebooksCasesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/notebooks/cases_for_notebooks/"

  def get_parameter (field)
    get_generic_parameter(field)
  end
end
