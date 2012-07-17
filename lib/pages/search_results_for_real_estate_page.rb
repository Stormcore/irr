# encoding: utf-8
require 'json'
require "#{File.dirname(__FILE__)}/search_results_page.rb"

class SearchResultsForRealEstatePage < SearchResultsPage
  include PageObject

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

    banned_classes = %w[multy-list-table banner-listing-list dontSearch]

    doc.css("tr").each do |row|
      # Skip of it is a banner or bottom 'not found' part
      banned_class_found = false
      banned_classes.each do |banned_class|
        if row['class'].include?(banned_class)
          banned_class_found = true
          break
        end
      end
      next if banned_class_found
      if row['class'].include? 'bottomParams'
        # city data
        begin
          results.last['city'] = row.css('td.tdTxt > span.location')[0].content.strip!
        end
        next
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
        h['url'] = BASE_URL + h['url'] unless h['url'].include? BASE_URL.gsub('http://','')
        ad_id = h['url'].match(/\/advert\/(.*)\//)[1]
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
        h['time'] = row.css('td.tdPrise > div.gray')[0].content
      rescue
      end


      begin
        date = parsed_json['items'][ad_id]['date']
        h['date'] = Date.strptime(date, '%H:%M, %d.%m.%Y')
      rescue
      end

      begin
        h['description'] = row.css('td.tdTxt > p')[0].content
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

end
