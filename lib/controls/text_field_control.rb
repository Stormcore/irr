module PageObject

  module Accessors

    def irr_text_field(nice_name, id)
      function_name = id.gsub(/-/,'_') # replace dashes with underscores
  
      # getter
      define_method("#{function_name}") do
        self.show_all_parameters
        xpath = "//table[@id='allParams']/tbody/tr[./th/span[text()='#{nice_name}']]/td"
        self.cell_element(:xpath => xpath).when_present.text
      end
      
      # setter
      define_method("#{function_name}=") do |hash|
        self.expand_all_parameters
        self.text_field_element(:name => id).value = hash['value']
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