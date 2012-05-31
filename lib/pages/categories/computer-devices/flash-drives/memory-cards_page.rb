# encoding: utf-8

class CategoryComputerFlashDrivesMemoryCardsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/flash_drives/memory_cards"
  @category = "Компьютерная техника -> Flash-накопители -> Карты памяти"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип карты", "type"
  irr_range_select "Объем памяти", "flash_size"

  def get_parameter(field)
    if field == "Объем памяти"
      super(field).gsub(/ Мб/,'')
    else
      super(field)
    end
  end
end
