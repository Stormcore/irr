# encoding: utf-8

class CategoryCarsPartsDisksPage < AdDetailsPage
  include PageObject
  @@getter_functions = Hash.new
  @@setter_functions = Hash.new
  @@url_suffix = "/cars/parts/disks"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "condition_c"
  irr_multi_select "Тип дисков", "diskstype"
  irr_multi_select "Производитель", "producerdisks"
  irr_multi_select "Диаметр обода", "diameter_obod"
  irr_multi_select "Ширина обода", "width_disks"
  irr_multi_select "Число болтов", "bolt"
  irr_multi_select "Расстояние между болтами (PCD)", "pcd"
  irr_multi_select "Вылет (ET)", "et"

  def set_parameter (hash)
    if @@setter_functions.has_key?(hash['parameter'])
      self.send "#{@@setter_functions[hash['parameter']]}", hash
    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Диаметр обода", "Ширина обода"
      # Вырезаем дюймы
      result = self.send("#{@@getter_functions[field]}").gsub(/ "/, '')

    when "Вылет (ET)", "Расстояние между болтами (PCD)"
      # Вырезаем миллиметры
      result = self.send("#{@@getter_functions[field]}").gsub(/ мм/, '')

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
