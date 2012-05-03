# encoding: utf-8

class CategoryCarsPartsDisksPage < AdDetailsPage
  include PageObject
  div :offertype, :xpath => "//div[@data-item-name='offertype']"
  div :condition_c, :xpath => "//div[@data-item-name='condition_c']"
  div :diskstype, :xpath => "//div[@data-item-name='diskstype']"
  div :producerdisks, :xpath => "//div[@data-item-name='producer_disks']"
  div :diameter_obod, :xpath => "//div[@data-item-name='diameter_obod']"
  div :width_disks, :xpath => "//div[@data-item-name='width_disks']"
  div :bolt, :xpath => "//div[@data-item-name='bolt']"
  div :pcd, :xpath => "//div[@data-item-name='pcd']"
  div :et, :xpath => "//div[@data-item-name='et']"

  def set_parameter (hash)
    case hash['parameter']

    when "Тип предложения"
      multiselect(self.offertype_element, hash['value'])

    when "Состояние"
      multiselect(self.condition_c_element, hash['value'])
      
    when "Тип дисков"
      multiselect(self.diskstype_element, hash['value'])
      
    when "Производитель"
      multiselect(self.producerdisks_element, hash['value'])
      
    when "Диаметр обода"
      multiselect(self.diameter_obod_element, hash['value'])
      
    when "Ширина обода"
      multiselect(self.width_disks_element, hash['value'])
      
    when "Число болтов"
      multiselect(self.bolt_element, hash['value'])

    when "PCD"
      multiselect(self.pcd_element, hash['value'])
      
    when "ET"
      multiselect(self.et_element, hash['value'])

    when "Источник"
      # TODO: Множественный селект вместо единичного
      multiselect(self.source_from_element, hash['value'])

    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Тип предложения", "Состояние", "Тип дисков", "Производитель"
      result = get_unique_parameter(field)
    when "Диаметр обода", "Ширина обода"
      result = get_unique_parameter(field)
      # Вырезаем дюймы
      result.gsub!(/ "/, '')
    when "ET", "PCD"
      result = get_unique_parameter(field)
      # Вырезаем миллиметры
      result.gsub!(/ мм/, '')
    else
      result = get_generic_parameter(field)
    end 
    result
  end
end