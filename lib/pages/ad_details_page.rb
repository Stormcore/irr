# encoding: utf-8

class AdDetailsPage
  include PageObject

  link :show_all_params, :id => "showAllParamsLink"
  
  div :title, :xpath => "//div[@id='wrapTitle']/div[@name='wrapTitleLeft']"
  div :video, :class => "b-video"

  def has_video?
    self.video_element.exists?
  end

  def show_all_parameters
    # Open all params if present
    if self.show_all_params_element.visible?
      self.show_all_params
    end
  end

  def get_generic_parameter(field)
    self.show_all_parameters
    case field
    when "Заголовок"
      result = self.title_element.when_present.text
    else
      # Custom field
      xpath = "//tr[contains(.,'#{field}')]/td"
      result = self.cell_element(:xpath => xpath).when_present.text
    end
    result
  end
  
  def get_value_parameter(field)
    self.show_all_parameters
    xpath = "//tr[contains(.,'#{field}')]/td/span[@class='value']"
    self.span_element(:xpath => xpath).when_present.text
  end
  
  def get_unique_parameter(field)
    self.show_all_parameters
    xpath = "//tr[contains(.,'#{field}')]/td"
    self.cell_element(:xpath => xpath).when_present.text
  end
end
