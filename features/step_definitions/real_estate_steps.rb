# encoding: utf-8

То %{в деталях $option объявления этаж первый} do |option, parameter|
  soft_assert_function = select_soft_assert_function(option)
  soft_assert_function("Неправильный этаж:") do |ad_page, result|
    ad_page.get_parameter("Этаж").should eql("1")
  end
end

То %{в деталях $option объявления этаж не первый} do |option, parameter|
  soft_assert_function = select_soft_assert_function(option)
  soft_assert_function("Неправильный этаж:") do |ad_page, result|
    ad_page.get_parameter("Этаж").should_not eql("1")
  end
end

То %{в деталях $option объявления этаж не последний} do |option, parameter|
  soft_assert_function = select_soft_assert_function(option)
  soft_assert_function("Неправильный этаж:") do |ad_page, result|
    ad_page.get_parameter("Этаж").should_nit eql(ad_page.get_parameter("Этажей в здании"))
  end
end