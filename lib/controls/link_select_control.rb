# encoding: utf-8

def irr_link_select(getter_name, identifier, popup, setter_name = nil)
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

  # selected
  define_method("#{function_name}_selected") do |hash|
    begin
      self.expand_all_parameters
      element = self.div_element(:xpath => identifier)
      element.link_element(:class => "combo_drop_link").text
    rescue Exception => e
      raise "Ошибка в поле #{getter_name} (id '#{identifier}')\n#{e}"
    end
  end

  #setter
  define_method("#{function_name}=") do |hash|
    begin
      self.expand_all_parameters
      element.link_element(:class => "combo_drop_link").when_present(10).click
      element = self.div_element(:xpath => identifier)
      element.link_element(:class => "combo_drop_link").when_present(10).click
      element.parent.div_element(:class => popup).
            link_element(:text => hash['value']).when_present.click
    rescue Exception => e
      raise "Ошибка в поле #{setter_name} (id '#{identifier}')\n#{e}"
    end
  end
  
  add_getters_and_setters(function_name, getter_name, setter_name)
end
