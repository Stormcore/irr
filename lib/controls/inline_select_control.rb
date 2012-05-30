# encoding: utf-8

def irr_inline_select(getter_name, identifier, setter_name = nil)
  function_name = identifier.gsub(/-/,'_') # replace dashes with underscores

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
    begin
      self.expand_all_parameters
      element = self.div_element(:xpath => "//div[@data-item-name='#{identifier}']")
      hash['value'].split(",").each do |value|
        element.link_element(:xpath => "//a[./span[text()='#{value}']]").
              when_present.click
      end
    rescue Watir::Exception::UnknownObjectException => e
      puts "ERROR: #{e.message}"
      raise "Ошибка в поле #{getter_name} (id '#{identifier}')"
    end
  end

  add_getters_and_setters(function_name, getter_name, setter_name)
end
