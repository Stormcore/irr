def irr_checkbox(getter_name, identifier, setter_name = nil)
  function_name = identifier.gsub(/-/,'_') # replace dashes with underscores

  # getter
  define_method("#{function_name}") do
    self.show_all_parameters
    xpath = "//table[@id='allParams']/tbody/tr[./th/span[text()='#{getter_name}']]/td/div[@class='bird']"
    self.div_element(:xpath => xpath).exists?
  end
  
  #setter
  define_method("#{function_name}=") do |hash|
    self.show_all_parameters
    self.checkbox_element(:name => identifier).click
  end
  
  add_getters_and_setters(function_name, getter_name, setter_name)
end

def add_getters_and_setters(function_name, getter_name, setter_name = nil)
  setter_name ||= getter_name
  # store getter and setter in hash
  @getter_functions ||= Hash.new
  @getter_functions[getter_name] = "#{function_name}"
  
  @setter_functions ||= Hash.new
  @setter_functions[setter_name] = "#{function_name}="
end