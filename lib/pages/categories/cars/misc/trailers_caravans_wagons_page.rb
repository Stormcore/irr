# encoding: utf-8

class CategoryCarsMiscTrailersCaravansWagonsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/trailers-caravans-wagons"
  @category = "Авто и мото -> Мототехника и автодома -> Автодома и легковые прицепы"

  irr_single_select "Тип предложения", "offertype"
  irr_single_select "Новый или подержанный", "used-or-new"
  irr_range_select "Год выпуска", "car-year"
  irr_range_select "Объем внешнего багажника", "trunk_value"
  
  def get_parameter (field)
    case field
    when "Объем внешнего багажника"
      result = self.send(self.class.instance_variable_get(:@getter_functions)[field])
      return result.gsub(/ л/, '')
    else 
      super(field)
    end
  end
end
