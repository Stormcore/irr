# encoding: utf-8

class CategoryJobsEducationVacanciesPrintMediaPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/print-media"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> СМИ, Издательство, полиграфия"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

