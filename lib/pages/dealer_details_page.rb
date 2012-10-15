# encoding: utf-8
class DealerDetailsPage
  include PageObject

  def get_parameter key
    self.div_element(class: "dealerInfoDetails").element.trs.find{|tr| 
      tr.div(class: "paramName", text: key).exists?
    }.td(index: 1).text
  end
end
