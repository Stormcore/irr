# encoding: utf-8

class CategoryCarsMiscTrailersCaravansWagonsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/trailers-caravans-wagons"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_range_select "Год выпуска", "car-year"
  irr_range_select "Объем внешнего багажника", "trunk_value"
  
  def get_parameter (field)
    case field
    when "Объем внешнего багажника"
      return self.send("#{@@getter_functions[field]}").gsub(/ л/, '')
    else 
      super(field)
    end
  end
end
