# encoding: utf-8
class AddAdvertStep1New
  include PageObject

  link :next_step, id: "nextStep2"
  div :custom_fields, id: "customfields"

  def wait_for_custom_fields_to_appear
    self.custom_fields_element.when_present
  end

end

class AddAdvertStep1
  include PageObject

  link :next_step, id: "nextStep2"

end
