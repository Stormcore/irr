# encoding: utf-8

def irr_single_select(getter_name, identifier, setter_name = nil)
  function_name = identifier.gsub(/-/,'_') # replace dashes with underscores

  # getter
  define_method("#{function_name}") do
    self.show_all_parameters
    xpath = "//table[@id='allParams']/tbody/tr[./th/span[text()='#{getter_name}']]/td"
    begin
      self.cell_element(:xpath => xpath).when_present(30).text
    rescue Exception => e
      raise "Параметр '#{getter_name}' не найден\n#{e}"
    end
  end
  
  # setter
  define_method("#{function_name}=") do |hash|
    begin
      self.expand_all_parameters
      element = self.div_element(:xpath => "//div[@data-item-name='#{identifier}']")
      element.when_present.visible?
      element.div_element(:class => "controlSelectS").when_present.click
      element.element.div(:text => hash['value'].strip).when_present.click
    rescue Exception => e
      puts "ERROR: #{e}"
      raise "Ошибка в поле #{getter_name} (id '#{identifier}')"
    end
  end

  add_getters_and_setters(function_name, getter_name, setter_name)
end
