#~ # encoding: utf-8
#~ 
#~ class CategoryRealEstateCommercialRentRetailPage < AdDetailsPage
  #~ include PageObject
  #~ include CityWithMetro
  #~ include Rent
  #~ @@getter_functions = Hash.new
  #~ @@setter_functions = Hash.new
  #~ @@url_suffix = "/real-estate/commercial/retail"
#~ 
  #~ text_field :square_min_from, :name => "square-min[from]"
  #~ text_field :square_min_to, :name => "square-min[to]"
  #~ div :trading_purpose, :xpath => "//div[@data-item-name='trading_purpose']"
  #~ div :state, :xpath => "//div[@data-item-name='state']"
#~ 
  #~ checkbox :first_line, :name => "first-line"
  #~ checkbox :entrance, :name => "entrance"
  #~ text_field :house_ceiling_height, :name => "house-ceiling-height"
#~ 
  #~ def set_parameter (hash)
    #~ case hash['parameter']
#~ 
    #~ when "Ремонт"
      #~ singleselect(self.state_element, hash['value'])
#~ 
    #~ when "1-я линия"
      #~ self.first_line_element.check
#~ 
    #~ when "Отдельный вход"
      #~ self.entrance_element.check
#~ 
    #~ when "Назначение помещения"
      #~ singleselect(self.trading_purpose_element, hash['value'])
#~ 
    #~ when "Охрана здания"
      #~ self.house_lift_element.check
#~ 
    #~ when "Высота потолков"
      #~ self.house_ceiling_height = hash['value']
#~ 
    #~ when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      #~ set_metro_parameter(hash)
#~ 
    #~ when "Валюта", "Срок сдачи"
      #~ set_rent_parameter(hash)
#~ 
    #~ else
      #~ super(hash)
    #~ end
  #~ end
#~ 
  #~ def get_parameter(field)
    #~ case field
    #~ when "Общая площадь", "Комнат в квартире", "Жилая площадь",
         #~ "Площадь кухни", "Ремонт", "Назначение помещения", "Высота потолков"
      #~ result = get_unique_parameter(field)
#~ 
    #~ when "Отказ получен", "Лифты в здании", "Газ в доме"
      #~ result = get_checkbox_parameter(field)
#~ 
    #~ when "АО", "Район города", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      #~ result = get_metro_parameter(field)
#~ 
    #~ else
      #~ result = get_generic_parameter(field) 
    #~ end
    #~ result
  #~ end
#~ end
