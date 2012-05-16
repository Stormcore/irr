module PageObject

  module Accessors

    def irr_checkbox(nice_name, id)
      function_name = id.gsub(/-/,'_') # replace dashes with underscores
  
      # getter
      define_method("#{function_name}") do
        self.show_all_parameters
        xpath = "//table[@id='allParams']/tbody/tr[./th/span[text()='#{field}']]/td/div[@class='bird']"
        self.div_element(:xpath => xpath).exists?
      end
      
      # setter
      define_method("#{function_name}=") do |hash|
        self.expand_all_parameters
        self.checkbox_element(:name => id).click
      end

      # store getter and setter in hash
      getters = self.class_variable_get(:@@getter_functions)
      getters[nice_name] = "#{function_name}"
      self.class_variable_set(:@@getter_functions, getters)
      
      setters = self.class_variable_get(:@@setter_functions)
      setters[nice_name] = "#{function_name}="
      self.class_variable_set(:@@setter_functions, setters)
    end
  end
end