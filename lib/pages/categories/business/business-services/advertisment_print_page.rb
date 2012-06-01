# encoding: utf-8

class CategoryBusinessBusinessServicesAdvertisemenPrintPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/business-services/advertisement-print"
  @category = "Бизнес и партнерство -> Бизнес услуги -> Реклама и полиграфия, печати и штампы"

  irr_multi_select "Тип предложения", "offertype"
end
