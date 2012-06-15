# encoding: utf-8

def irr_range_select(getter_name, identifier, setter_name = nil)
  function_name = identifier.gsub(/-/,'_') # replace dashes with underscores

  # getter
  define_method("#{function_name}") do
    begin
      if self.show_all_params_element.element.present?
        self.show_all_params
        Watir::Wait.until(10) {self.all_params_element.style('display') == "table"}
      end
    rescue Watir::Wait::TimeoutError
      raise "Вкладка 'Все' не открыта за 10 секунд"
    end
    xpath = "//table[@id='allParams']/tbody/tr[./th/span[text()='#{getter_name}']]/td"
    begin
      self.cell_element(:xpath => xpath).when_present(10).text
    rescue Exception => e
      raise "Параметр '#{getter_name}' не найден\n#{e}"
    end
  end

  #selected
  define_method("#{function_name}_selected") do |hash|
    begin
      self.expand_all_parameters
      min_result = self.text_field_element(:name => "#{identifier}[from]").value
      max_result = self.text_field_element(:name => "#{identifier}[from]").value
      return {"min" => min_result, "max" => max_result}
    rescue Exception => e
      raise "Ошибка в поле #{setter_name} (id '#{identifier}')\n#{e}"
    end
  end
  
  # setter
  define_method("#{function_name}=") do |hash|
    begin
      self.expand_all_parameters
      self.text_field_element(:name => "#{identifier}[from]").value = hash['min']
      self.text_field_element(:name => "#{identifier}[to]").value = hash['max']
    rescue Exception => e
      raise "Ошибка в поле #{getter_name} (id '#{identifier}')\n#{e}"
    end
  end

  add_getters_and_setters(function_name, getter_name, setter_name)
end
