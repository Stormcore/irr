# encoding: utf-8

def irr_language_select(getter_name, identifier, setter_name = nil)
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
      self.cell_element(xpath: xpath).when_present(10).text
    rescue Exception => e
      raise "Параметр '#{getter_name}' не найден\n#{e}"
    end
  end

  # selected
  define_method("#{function_name}_selected") do |hash|
    language = hash['value'].split[0]
    level = hash['value'].split[1]
    begin
      self.expand_all_parameters
      element = self.div_element(xpath: "//div[@data-item-name='#{identifier}']")
      unless element.div_element(class: "controlSelect").visible?
        element = self.div_element(xpath: "//div[@data-name='#{identifier}']")
      end
      element.when_present(10).visible?.should == true
      element.div_element(class: "controlSelect", index: 0).when_present(10).click
      language_result = element.label_element(text: language).when_present(10).checkbox_element.checked?
      element.div_element(class: "controlSelect", index: 0).when_present(10).click

      element.div_element(class: "controlSelect", index: 1).when_present(10).click
      level_result = element.label_element(text: level).when_present(10).checkbox_element.checked?
      element.div_element(class: "controlSelect", index: 1).when_present(10).click
      return (language_result and level_result)
    rescue Exception => e
      raise "Ошибка в поле #{getter_name} (id '#{identifier}')\n#{e}"
    end
  end
  
  # setter
  define_method("#{function_name}=") do |hash|
    begin
      self.expand_all_parameters
      element = self.div_element(xpath: "//div[@data-item-name='#{identifier}']")
      element.when_present.visible?
      element.div_element(class: "controlSelectS", index: 0).when_present(10).click
      element.element.div(text: hash['value'].strip.split[0]).when_present(10).click
      element.div_element(class: "controlSelectS", index: 1).when_present(10).click
      element.element.div(text: hash['value'].strip.split[1]).when_present(10).click
    rescue Exception => e
      raise "Ошибка в поле #{getter_name} (id '#{identifier}')\n#{e}"
    end
  end

  add_getters_and_setters(function_name, getter_name, setter_name)
end
