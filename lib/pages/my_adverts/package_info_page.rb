# encoding: utf-8

class PackageInfoPage
  include PageObject

  select_list :package, :name => "package"

  def get_field_value(field)
    self.element("strong", :xpath => "//div[contains(.,'#{field}')]/strong").when_present.text.strip
  end

  def select_package(name)
    begin
      self.package_element.when_present(10).select(name)
    rescue Watir::Wait::TimeoutError => e
      puts "Переключатель пакетов отсутствует"
    end
  end
end
