# encoding: utf-8

class CategoryJobsEducationVacanciesHorecaPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/horeca"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Ресторанный бизнес, фастфуд"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

