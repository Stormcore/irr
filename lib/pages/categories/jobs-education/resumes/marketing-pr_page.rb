# encoding: utf-8

class CategoryJobsEducationresumesMarketingPRPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/resumes/marketing-pr"
  @category = "Работа и образование -> Резюме: поиск работы -> Маркетинг, Реклама, PR"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
  irr_single_select "Пол", "job_sex"
  irr_range_select "Возраст", "age"
  irr_single_select "Образование", "job_education"
  irr_language_select "Иностранный язык", "language_type"
  irr_multi_select "Водительские права", "driving_license"
  irr_checkbox     "Личный автомобиль", "car"
end

