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


  def set_parameter (hash)
    if @@setter_functions.has_key?(hash['parameter'])
      self.send "#{@@setter_functions[hash['parameter']]}", hash
    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Диагональ"
      result = self.send("#{@@getter_functions[field]}").gsub(/ дюймов/, '')
    when "Объем памяти"
      result = self.send("#{@@getter_functions[field]}").gsub(/ Мб/, '')
    when "Размер жесткого диска"
      result = self.send("#{@@getter_functions[field]}").gsub(/ Гб/, '')
    when "Время работы от аккумулятора"
      result = self.send("#{@@getter_functions[field]}").gsub(/ ч/, '')
    when "Вес"
      result = self.send("#{@@getter_functions[field]}").gsub(/ кг/, '')
    else
      if @@getter_functions.has_key?(field)
        result = self.send("#{@@getter_functions[field]}")
      else
        result = get_generic_parameter(field)
      end
    end
    result
  end
end
