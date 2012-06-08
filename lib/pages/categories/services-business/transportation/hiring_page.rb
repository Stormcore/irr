# encoding: utf-8

class CategoryServicesBusinessTransportationHiringPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/transportation/hiring"
  @category = "Услуги и деятельность -> Транспортные услуги и аренда -> Такси, аренда и прокат, пассажирские перевозки"

  irr_multi_select "Тип предложения", "offer"
  irr_single_select "Вид транспорта", "auto_type"
  irr_single_select "Назначение", "use_type"
  irr_single_select "С водителем", "driver_type"
  irr_range_select "Кол-во мест", "seat_number"
  irr_multi_select "Доп. опции", "add_option"
end

