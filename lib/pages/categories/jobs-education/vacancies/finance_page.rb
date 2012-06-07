# encoding: utf-8

class CategoryJobsEducationVacanciesFinancePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/finance"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Финансы, бухгалтерия, банк"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

