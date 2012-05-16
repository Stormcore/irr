# encoding: utf-8

class CategoryCarsMiscTrailersCaravansWagonsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/trailers-caravans-wagons"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_range_select "Год выпуска", "car-year"
  irr_range_select "Объем внешнего багажника", "trunk_value"

  def set_parameter (hash)
    if @@setter_functions.has_key?(hash['parameter'])
      self.send "#{@@setter_functions[hash['parameter']]}", hash
    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Объем внешнего багажника"
      # Вырезаем литры
      result = self.send("#{@@getter_functions[field]}").gsub(/ л/, '')
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
