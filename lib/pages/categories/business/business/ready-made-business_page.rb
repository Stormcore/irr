# encoding: utf-8

class CategoryBusinessBusinessReadyMadeBusinessPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/business/ready-made-business"
  @category = "Бизнес и партнерство -> Готовый бизнес -> Бизнес под ключ"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Тип бизнеса", "business_type"
  irr_range_select "Доля в бизнесе, %", "business_share"
  irr_range_select "Срок существования бизнеса, лет", "business_length"
end
