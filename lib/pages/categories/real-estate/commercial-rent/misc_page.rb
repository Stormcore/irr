#~ # encoding: utf-8
#~ 
#~ class CategoryRealEstateCommercialRentMiscPage < AdDetailsPage
  #~ include PageObject
  #~ include CityWithMetro
  #~ include Rent
#~ 
  #~ @@url_suffix = "/real-estate/commercial/misc"
#~ 
  #~ irr_text_field   "Общая площадь", "square-min"
  #~ irr_checkbox     "1-я линия", "first-line"
  #~ irr_checkbox     "Отдельный вход", "equipment"
#~ 
  #~ def get_parameter (field)
    #~ case field
    #~ when "Линия метро", "Станция метро", "До метро"
      #~ return get_metro_parameter(field)
    #~ else
      #~ super(field)
    #~ end
  #~ end
#~ end
