# encoding: utf-8

class CategoryComputerDevicesNotebooksNotebooksPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/notebooks/notebooks/"

  div :offertype, :xpath => "//div[@data-item-name='offertype']"
  div :used_or_new, :xpath => "//div[@data-item-name='used-or-new']"
  div :make, :xpath => "//div[@data-item-name='make']"
  text_field :diagonal_from, :name => "diagonal[from]"
  text_field :diagonal_to, :name => "diagonal[to]"
  div :cpu, :xpath => "//div[@data-item-name='cpu']"
  div :ram_size, :xpath => "//div[@data-item-name='ram_size']"
  text_field :hdd_from, :name => "hdd[from]"
  text_field :hdd_to, :name => "hdd[to]"
  div :vgatype, :xpath => "//div[@data-item-name='vgatype']"
  text_field :battery_from, :name => "battery[from]"
  text_field :battery_to, :name => "battery[to]"
  div :wireless, :xpath => "//div[@data-item-name='wireless_interfaces_multi']"
  text_field :weight_from, :name => "weight[from]"
  text_field :weight_to, :name => "weight[to]"

  def set_parameter (hash)
    case hash['parameter']

    when "Тип предложения"
      multiselect(self.offertype_element, hash['value'])

    when "Состояние"
      multiselect(self.used_or_new_element, hash['value'])

    when "Марка"
      multiselect(self.make_element, hash['value'])

    when "Диагональ экрана"
      self.diagonal_from = hash['min']
      self.diagonal_to = hash['max']

    when "Тип процессора"
      multiselect(self.cpu_element, hash['value'])
      
    when "Объем памяти"
      multiselect(self.ram_size_element, hash['value'])

    when "Размер жесткого диска"
      self.hdd_from = hash['min']
      self.hdd_to = hash['max']

    when "Тип видеокарты"
      multiselect(self.vgatype_element, hash['value'])

    when "Время работы от батареи"
      self.battery_from = hash['min']
      self.battery_to = hash['max']

    when "Беспроводные интерфейсы"
      multiselect(self.wireless_element, hash['value'])

    when "Вес"
      self.weight_from = hash['min']
      self.weight_to = hash['max']

    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Диагональ экрана"
      result = get_unique_parameter(field).gsub(/ дюймов/, '')
    when "Объем памяти"
      result = get_unique_parameter(field).gsub(/ Мб/, '')
    when "Размер жесткого диска"
      result = get_unique_parameter(field).gsub(/ Гб/, '')
    when "Время работы от аккумулятора"
      result = get_unique_parameter(field).gsub(/ ч/, '')
    when "Вес"
      result = get_unique_parameter(field).gsub(/ кг/, '')
    when "Новый или подержанный", "Тип предложения", "Состояние", "Марка",
         "Тип видеокарты", "Беспроводные интерфейсы"
      result = get_unique_parameter(field)
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
