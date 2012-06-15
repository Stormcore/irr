# encoding: utf-8

class PowersellersListPage
  include PageObject

  direct_url BASE_URL+"/powerSellers/list/"

  table :powersellers, :xpath => "//div[@class='b-adListTable b-adTblIP']/table"

  def get_powerseller_number
    self.powersellers_element.when_present.rows
  end
end

class Powerseller
  def initialize(element)
    @element = element
  end

  def get_name
    @element.element.cell(:index => 1).text
  end

  def has_photo
    @element.image_element.exists?
  end

  def get_photo
    @element.image_element.when_present.attribute("src")
  end
end
