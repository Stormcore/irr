# encoding: utf-8

class CategoryRealEstateApartmentsSaleNewPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/apartments-sale/new"

  irr_inline_select "Комнат в квартире", "rooms"
  irr_range_select  "Общая площадь", "meters-total"
  
  span :show_kitchen_params, :text => 'Площадь Жилая/Кухня'
  irr_range_select  "Жилая площадь", "meters-living"
  irr_range_select  "Площадь кухни", "meters-kitchen"
  
  irr_multi_select  "Этаж", "floor_house"
  irr_checkbox      "Приватизированная квартира", "private"
  irr_single_select "Отделка", "state"
  irr_checkbox      "Балкон/Лоджия", "balcony"
  irr_range_select  "Этаж в здании", "etage-all"
  irr_checkbox      "Лифты в здании", "house-lift"
  irr_checkbox      "Газ в доме", "gas"
  
  def set_parameter (hash)
    if @@setter_functions.has_key?(hash['parameter'])
      self.send "#{@@setter_functions[hash['parameter']]}", hash
    end

    case hash['parameter']
    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      set_metro_parameter(hash)
    else
      super(hash)
    end
  end

  def set_parameter (hash)
    unless self.kitchen_from_element.visible?
      self.show_kitchen_params_element.parent.click
    end
    if @@setter_functions.has_key?(hash['parameter'])
      self.send "#{@@setter_functions[hash['parameter']]}", hash
    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "АО", "Район города", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      result = get_metro_parameter(field)
    else
      if @@getter_functions.has_key?(field)
        self.send("#{@@getter_functions[field]}")
      else
        get_generic_parameter(field)
      end
    end
  end
end
