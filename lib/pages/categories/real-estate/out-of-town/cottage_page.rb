#~ # encoding: utf-8
#~ 
#~ class CategoryRealEstateOutoftownCottagePage < AdDetailsPage
  #~ include PageObject
  #~ include CityWithMetro
  #~ 
  #~ @@url_suffix = "/real-estate/out-of-town/cottage"
#~ 
  #~ text_field :meters_total_from, :name => "meters-total[from]"
  #~ text_field :meters_total_to, :name => "meters-total[to]"
  #~ text_field :land_from, :name => "land[from]"
  #~ text_field :land_to, :name => "land[to]"
#~ 
  #~ def set_parameter (hash)
    #~ case hash['parameter']
#~ 
    #~ when "Площадь дома"
      #~ self.meters_total_from = hash['min']
      #~ self.meters_total_to = hash['max']
#~ 
    #~ when "Площадь участка"
      #~ self.land_from = hash['min']
      #~ self.land_to = hash['max']
#~ 
    #~ when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      #~ set_metro_parameter(hash)
    #~ else
      #~ super(hash)
    #~ end
  #~ end
#~ 
  #~ def get_parameter(field)
    #~ case field
    #~ when "Площадь строения", "Площадь участка"
      #~ result = get_unique_parameter(field)
#~ 
    #~ when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      #~ set_metro_parameter(hash)
    #~ else
      #~ result = get_generic_parameter(field) 
    #~ end
    #~ result
  #~ end
#~ end
