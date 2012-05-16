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
      
      add_getters_and_setters(function_name, nice_name)
    end
    
    def add_getters_and_setters(function_name, nice_name)
      # store getter and setter in hash
      unless self.class_variables.include? :@@getter_functions
        self.class_variable_set(:@@getter_functions, Hash.new)
      end 
      getters = self.class_variable_get(:@@getter_functions)
      getters[nice_name] = "#{function_name}"
      self.class_variable_set(:@@getter_functions, getters)
      
      unless self.class_variables.include? :@@setter_functions
        self.class_variable_set(:@@setter_functions, Hash.new)
      end 
      setters = self.class_variable_get(:@@setter_functions)
      setters[nice_name] = "#{function_name}="
      self.class_variable_set(:@@setter_functions, setters)
    end
  end
end