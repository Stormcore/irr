def irr_checkbox_with_value(getter_name, identifier, setter_name = nil)
  function_name = identifier.gsub(/-/,'_') # replace dashes with underscores

  # getter
  define_method("#{function_name}") do
    self.show_all_parameters
    xpath = "//table[@id='allParams']/tbody/tr[./th/span[text()='#{getter_name}']]/td"
    self.cell_element(:xpath => xpath).when_present.text
  end

  #setter
  define_method("#{function_name}=") do |hash|
    self.show_all_parameters
    self.checkbox_element(:name => identifier).click
  end

  add_getters_and_setters(function_name, getter_name, setter_name)
end
