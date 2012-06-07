# encoding: utf-8

class CategoryServicesBusinessDocumentsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/documents"
  @category = "Услуги и деятельность -> Помощь в оформлении документов"

  irr_multi_select "Тип предложения", "offertype"
end

