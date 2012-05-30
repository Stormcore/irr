# encoding: utf-8

def irr_range_select(getter_name, id, setter_name = nil)
  function_name = id.gsub(/-/,'_') # replace dashes with underscores

  # getter
  define_method("#{function_name}") do
    self.show_all_parameters
    xpath = "//table[@id='allParams']/tbody/tr[./th/span[text()='#{getter_name}']]/td"
    begin
      self.cell_element(:xpath => xpath).when_present.text
    rescue Watir::Wait::TimeoutError => exception
      raise "Параметр '#{getter_name}' не найден"
    end
  end
  
  # setter
  define_method("#{function_name}=") do |hash|
    self.expand_all_parameters
    self.text_field_element(:name => "#{id}[from]").value = hash['min']
    self.text_field_element(:name => "#{id}[to]").value = hash['max']
  end

  add_getters_and_setters(function_name, getter_name, setter_name)
end
