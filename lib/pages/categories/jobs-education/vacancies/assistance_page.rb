# encoding: utf-8

class CategoryJobsEducationVacanciesAssistancePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/assistance"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Обслуживающий персонал, секретариат, АХО"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

