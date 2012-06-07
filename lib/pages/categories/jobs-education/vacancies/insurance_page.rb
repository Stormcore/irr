# encoding: utf-8

class CategoryJobsEducationVacanciesInsurancePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/insurance"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Страхование"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

