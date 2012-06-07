# encoding: utf-8

class CategoryJobsEducationVacanciesProvisionPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/provision"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Закупки и снабжение"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

