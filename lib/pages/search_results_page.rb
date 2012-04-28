class SearchResultsPage
  include PageObject

  table :results_table, :class => "adListTable"
  unordered_list :pages, :class => "filter-pages"
  div :side_column, :class => "side-col"

  def search_results
    results = []
    doc = Nokogiri::HTML.parse(results_table_element.when_present.html)
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

      h['premium'] = row['class'].include? 'premium'

      begin
        h['thumbnail'] = row.css('td.tdImg > a.wrapImg > img')[0]['src']
      rescue
      end

      begin
        h['url'] = row.css('td.tdTxt > div.h3 > a')[0]['href']
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
        h['price'] = row.css('td.tdPrise > div.prise')[0].content
      rescue
      end

      results << h
    end
    results
  end

  def highlight_result_by_url(url)
    ad_link = results_table_element.link_element(:href => url)
    @browser.execute_script("arguments[0].style='background-color: red'", ad_link)
  end

  def table_right_position
    self.results_table_element.wd.location.x + self.results_table_element.wd.size.width
  end

  def banner_left_position
    self.side_column_element.wd.location.x
  end
  
  def open_ad(url)
    @browser.goto("#{BASE_URL}/#{url}")
  end

  def go_to_page(number)
    next_page = self.pages_element.link_element(:link_text => number.to_s)
    next_page.when_present
    puts "Moving to page #{number}"
    next_page.click
  end
end
