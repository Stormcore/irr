# encoding: utf-8
class AdDetailsPage
  include PageObject

  link :show_all_params, :id => "showAllParamsLink"
  
  div :title, :xpath => "//div[@id='wrapTitle']/div[@name='wrapTitleLeft']"
  div :video, :class => "b-video"

  def has_video?
    self.video_element.exists?
  end

  def get_generic_parameter(field)
    # Open all params if present
    if self.show_all_params_element.visible?
      self.show_all_params
    end
    case field
    when "Заголовок"
      result = self.title_element.when_present.text
    else
      # Custom field
      xpath = "//tr[contains(.,'#{field}')]"
      result = self.cell_element(:xpath => xpath, :index => 1).when_present.text
    end
    result
  end
  
  def get_unique_parameter(field)
    # Open all params if present
    if self.show_all_params_element.shown?
      self.show_all_params
    end
    xpath = "//tr[contains(.,'#{field}')]"
    self.cell_element(:xpath => xpath).when_present.text
  end
end
