# encoding: utf-8

def irr_multi_select(getter_name, identifier, setter_name = nil, table = "allParams")
  function_name = identifier.gsub(/-/,'_') # replace dashes with underscores

  # getter
  define_method("#{function_name}") do
    self.show_all_parameters if table == 'allParams'
    xpath = "//table[@id='#{table}']/tbody/tr[./th/span[text()='#{getter_name}']]/td"
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
      unless element.div_element(:class => "controlSelect").visible?
        element = self.div_element(:xpath => "//div[@data-name='#{identifier}']")
      end
      element.when_present.visible?
      element.div_element(:class => "controlSelect").when_present(30).click
      hash['value'].split(", ").each do |value|
        element.label_element(:text => value).when_present(30).checkbox_element.check
      end
      element.div_element(:class => "controlSelect").when_present(30).click
    rescue Exception => e
      raise "Ошибка в поле #{getter_name} (id '#{identifier}')\n#{e}"
    end
  end

  add_getters_and_setters(function_name, getter_name, setter_name)
end
