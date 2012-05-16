module PageObject

  module Accessors

    def irr_link_select(nice_name, identifier)
      function_name = identifier.gsub(/-/,'_') # replace dashes with underscores
  
      # getter
      define_method("#{function_name}") do
        self.show_all_parameters
        xpath = "//table[@id='allParams']/tbody/tr[./th/span[text()='#{nice_name}']]/td"
        self.cell_element(:xpath => xpath).when_present.text
      end
      
      # setter
      define_method("#{function_name}=") do |hash|
        self.expand_all_parameters
        element = self.div_element(:xpath => "//div[@data-item-name='#{identifier}']")
        element.link_element(:class => "combo_drop_link").when_present.click
        element.parent.div_element(:class => list_name).
                link_element(:text => hash['value']).when_present.click
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