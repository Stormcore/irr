# encoding: utf-8

class CategoryJobsEducationVacanciesRealEstatePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/real-estate"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Недвижимость, риэлторство"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

