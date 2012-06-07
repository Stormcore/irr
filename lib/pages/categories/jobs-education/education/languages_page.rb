# encoding: utf-8

class CategoryJobsEducationEducationLanguagesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/education/languages"
  @category = "Работа и образование -> Образование -> Иностранные языки"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Языки", "language_type"
  irr_single_select "Уровень", "study_level"
  irr_single_select "Возрастные группы", "language_for"
  irr_range_select "Стаж репетиторской деятельности", "practice_period"
  irr_checkbox     "Носитель языка", "native_language"
  irr_checkbox     "Выезд", "visit"
end
