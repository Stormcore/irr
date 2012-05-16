# encoding: utf-8

class CategoryComputerDevicesNotebooksNotebooksPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/notebooks/netbooks_umpc/"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_multi_select "Модель", "make"
  irr_range_select "Диагональ", "diagonal"
  irr_multi_select "Тип процессора", "cpu"
  irr_multi_select "Объем памяти", "ram_size"
  irr_range_select "Размер жесткого диска", "hdd"
  irr_multi_select "Тип видеокарты", "vgatype"
  irr_range_select "Время работы от батареи", "battery"
  irr_multi_select "Беспроводные интерфейсы", "wireless_interfaces_multi"
  irr_range_select "Вес", "weight"

  def get_parameter (field)
    case field
    when "Диагональ"
      return self.send("#{@@getter_functions[field]}").gsub(/ дюймов/, '')
    when "Объем памяти"
      return self.send("#{@@getter_functions[field]}").gsub(/ Мб/, '')
    when "Размер жесткого диска"
      return self.send("#{@@getter_functions[field]}").gsub(/ Гб/, '')
    when "Время работы от аккумулятора"
      return self.send("#{@@getter_functions[field]}").gsub(/ ч/, '')
    when "Вес"
      return self.send("#{@@getter_functions[field]}").gsub(/ кг/, '')
    else
      super(field)
    end
  end
end
