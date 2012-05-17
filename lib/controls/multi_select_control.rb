def irr_multi_select(getter_name, identifier, setter_name = nil)
  function_name = identifier.gsub(/-/,'_') # replace dashes with underscores

  # getter
  define_method("#{function_name}") do
    self.show_all_parameters
    xpath = "//table[@id='allParams']/tbody/tr[./th/span[text()='#{getter_name}']]/td"
    self.cell_element(:xpath => xpath).when_present.text
  end
  
  # setter
  define_method("#{function_name}=") do |hash|
    self.expand_all_parameters
    element = self.div_element(:xpath => "//div[@data-item-name='#{identifier}']")
    unless element.div_element(:class => "controlSelect").visible?
      element = self.div_element(:xpath => "//div[@data-name='#{identifier}']")
    end
    element.div_element(:class => "controlSelect").when_present.click
    hash['value'].split(", ").each do |value|
      element.label_element(:text => value).when_present.checkbox_element.check
    end
    element.div_element(:class => "controlSelect").when_present.click 
  end

  add_getters_and_setters(function_name, getter_name, setter_name)
end
