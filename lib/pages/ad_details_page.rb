# encoding: utf-8
class AdDetailsPage
  include PageObject

  link :show_all_params, :id => "showAllParamsLink"
  
  div :title, :xpath => "//div[@id='wrapTitle']/div[@name='wrapTitleLeft']"
  div :video, :class => "b-video"

  def has_video?
    self.video_element.exists?
  end
  
  def get_parameter(field)
    # Open all params if present
    if self.show_all_params_element.shown?
      self.show_all_params
    end
    
    case field
    when "Заголовок"
      result = self.title_element.text
    else
      # Custom field
      xpath = "//tr[contains(.,'#{field}')]/td"
      result = self.cell_element(:xpath => xpath, :index => 1).text
    end
    result
  end
end
