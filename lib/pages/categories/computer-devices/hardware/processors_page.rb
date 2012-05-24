# encoding: utf-8

class CategoryComputerHardwareProcessorsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/hardware/processors"
  @category = "Компьютерная техника -> Комплектующие -> Процессоры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Производитель", "make"
  irr_range_select "Частота", "frequency"

  def get_parameter(field)
    if field == "Объем памяти"
      super(field).gsub(/ МГц/,'')
    else
      super(field)
    end
  end
end
