# encoding: utf-8
require 'json'

class SearchResultsPage
  include PageObject

  div :results_table, :class => "b-adList"
  unordered_list :pages, :class => "filter-pages"
  div :side_column, :class => "side-col"

  def search_results
    results = []
    attempts = 3
    begin
      doc = Nokogiri::HTML.parse(results_table_element.when_present.element.html)
    rescue
      raise "Список объявлений не был загружен" if attempts == 0
      self.refresh
      attempts -= 1
      retry
    end
    json = /var additionalPopupMenuParams = (.*);/.match(doc.css("script").inner_html)[1]
    parsed_json = JSON.parse(json)

    doc.css("tr").each do |row|
      # Skip of it is a banner or bottom 'not found' part
      if row['class'].include?('banner-listing-list') or row['class'].include?('dontSearch')
        next
      end
      # city data
      if row['class'].include? 'bottomParams'
        begin
          city = row.css('td.tdTxt > span.location')[0].content
          results.last['city'] = city.strip!
          next
        end
      end
  
      h = Hash.new
      begin
        h['title'] = row.css('td.tdTxt > div.h3 > a')[0].content
      rescue
      end

      begin
        h['premium'] = row['class'].include? 'premium'
      rescue
      end

      begin
        h['thumbnail'] = row.css('td.tdImg > a.wrapImg > img')[0]['src']
      rescue
      end

      begin
        h['url'] = row.css('td.tdTxt > div.h3 > a')[0]['href']
        ad_id = h['url'].match(/\/advert\/(.*)\//)[1]
      rescue
      end

      begin
        h['description'] = row.css('td.tdTxt > p')[0].content
      rescue
      end

      begin
        h['snippet'] = row.css('td.tdTxt span.snippet')[0].content
      rescue
      end

      begin
        full_price = row.css('td.tdPrise > div.prise')[0].content
        if full_price.index(" ") > 0
          h['price'] = full_price.match(/(.*) /)[1].gsub(' ','')
          h['currency'] = full_price.split(" ")[-1]
        else
          h['price'] = full_price
        end
      rescue
      end

      begin
        date = parsed_json['items'][ad_id]['date']
        h['date'] = Date.strptime(date, '%H:%M, %d.%m.%Y')
      rescue
      end
      
      begin
        h['source_title'] = parsed_json['items'][ad_id]['source_title']
        h['source_link'] = parsed_json['items'][ad_id]['source_link']
      rescue
      end
      
      results << h
    end
    results
  end

  def highlight_result_by_url(url)
    @browser.execute_script <<-JS
        var a = $('a[href="#{url}"]:parent')[0]
        a.parentElement.parentElement.setAttribute("style", "background-color:red")
    JS
  end

  def table_right_position
    self.results_table_element.wd.location.x + self.results_table_element.wd.size.width
  end

  def banner_left_position
    self.side_column_element.wd.location.x
  end
  
  def open_ad(url)
    @browser.goto("#{BASE_URL}#{url}")
  end

  def go_to_page(number)
    next_page = self.pages_element.link_element(:link_text => number.to_s)
    next_page.when_present
    puts "Moving to page #{number}"
    next_page.click
  end
end
