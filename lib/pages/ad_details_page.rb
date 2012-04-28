class AdDetailsPage
  include PageObject

  div :title, :xpath => "//div[@id='wrapTitle']/div[@name='wrapTitleLeft']"

  def get_parameter(field)
    self.cell_element(:xpath => "//tr[contains(.,'#{field}')]/td").text
  end
end
