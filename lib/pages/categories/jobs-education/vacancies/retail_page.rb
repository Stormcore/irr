# encoding: utf-8

class CategoryJobsEducationVacanciesRetailPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/retail"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Продажи"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

