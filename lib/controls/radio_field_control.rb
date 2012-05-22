def irr_radio_select(getter_name, identifier, setter_name = nil, table = "allParams")
  function_name = identifier.gsub(/-/,'_') # replace dashes with underscores

  # getter
  define_method("#{function_name}") do
    self.show_all_parameters if table == 'allParams'
    xpath = "//table[@id='#{table}']/tbody/tr[./th/span[text()='#{getter_name}']]/td"
    self.cell_element(:xpath => xpath).when_present.text
  end
  
  # setter
  define_method("#{function_name}=") do |hash|
    self.expand_all_parameters
    element = self.div_element(:xpath => "//div[@data-item-name='#{identifier}']")
    element.radio_button_element(:xpath => "//label[@class='chk-b '][contains(.,'#{hash['value']}')]/input").when_present.click 
  end

  add_getters_and_setters(function_name, getter_name, setter_name)
end
