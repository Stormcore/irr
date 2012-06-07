# encoding: utf-8

class CategoryJobsEducationVacanciesSecurityPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/security"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Охрана, безопасность"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

