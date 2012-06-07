# encoding: utf-8

class CategoryJobsEducationVacanciesEducationPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/education"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Образование, наука, культура"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

