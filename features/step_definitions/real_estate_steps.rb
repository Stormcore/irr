# encoding: utf-8

То %{в деталях $option объявления этаж $parameter} do |option, parameter|
  soft_assert_function = select_soft_assert_function(option)
  soft_assert_function("Неправильный этаж:") do |ad_page, result|
    case parameter
    when "первый"
      ad_page.get_parameter("Этаж").should eql("1")
    when "не первый"
      ad_page.get_parameter("Этаж").should_not eql("1")
    when "не последний"
      ad_page.get_parameter("Этаж").should_nit eql(ad_page.get_parameter("Этажей в здании"))
    end
  end
end
