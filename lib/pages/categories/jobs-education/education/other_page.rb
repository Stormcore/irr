# encoding: utf-8

class CategoryJobsEducationEducationOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/education/other"
  @category = "Работа и образование -> Образование -> Другое"

  irr_multi_select "Тип предложения", "offertype"
end
