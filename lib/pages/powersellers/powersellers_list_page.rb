# encoding: utf-8

class PowersellersListPage
  include PageObject

  table :powersellers, xpath: "//div[@class='b-adListTable b-adTblIP']/table"

  def get_powerseller_number
    self.powersellers_element.when_present.rows
  end

  def get_powerseller_by_name(name)
    link = self.powersellers_element.link_element(text: name)
    raise "Не найден интернет-партнер '#{name}'" unless link.exists?
    Powerseller.new(link.parent.parent)
  end
end

class Powerseller
  def initialize(element)
    @element = element
  end

  def get_name
    @element.element.cell(index: 1).text
  end

  def get_counter
    @element.element.cell(index: 3).text
  end

  def has_photo
    @element.image_element.exists?
  end

  def get_photo
    @element.image_element.when_present.attribute("src")
  end
end
