# encoding: utf-8
BASE_URL = ENV['BASE_URL'] || "http://irr.ru"
HEADLESS = ENV['HEADLESS'] || false
DRIVER = (ENV['WEB_DRIVER'] || :firefox).to_sym
ENABLE_FLASH = ENV['FLASH'] || false
FAIL_FAST = ENV['FAILFAST'] || false

require 'bundler/setup'
require 'watir-webdriver'
require "watir-webdriver/extensions/alerts"
require "watir-webdriver-performance"
require 'page-object'
require 'page-object/page_factory'
require 'nokogiri'
require 'debugger'
require 'net/http'
require 'uri'
require 'date'
require 'unicode_utils/downcase'
require 'cucumber/formatter/unicode'
require 'selenium/webdriver/remote/http/persistent'
require 'yaml'
require 'net/ssh'
require 'net/sftp'


$: << File.dirname(__FILE__)+'/../../lib'
require 'pages.rb'

World PageObject::PageFactory

#if HEADLESS
#  puts "Starting xvfb.."
#  require 'headless'
#  headless = Headless.new(dimensions: "1600x1200x16")
#  headless.start
#end

def start_browser
  case DRIVER
  when :firefox
    puts "Запускаем firefox..."
    client = Selenium::WebDriver::Remote::Http::Persistent.new
    client.timeout = 60
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile.native_events = false
    profile['toolkit.telemetry.prompted'] = true
    profile['plugin.click_to_play'] = true unless ENABLE_FLASH
    profile.add_extension "features/support/JSErrorCollector.xpi"
    profile.add_extension "features/support/flashblock.xpi" unless ENABLE_FLASH
    browser = Watir::Browser.new(DRIVER, profile: profile, http_client: client)

  when :chrome
    puts "Запускаем chrome"
    client = Selenium::WebDriver::Remote::Http::Persistent.new
    client.timeout = 60
    profile = Selenium::WebDriver::Chrome::Profile.new
    switches = %w[--bwsi --disable-translate --start-maximized]
    browser = Watir::Browser.new(DRIVER, profile: profile, http_client: client, switches: switches)
  end
  return browser
end

browser = start_browser

# Проверяем на ошибки JS
def get_js_error_feedback
  jserror_descriptions = ""
  begin
    jserrors = @browser.execute_script("return window.JSErrorCollector_errors.pump()")
    jserrors.each do |jserror|
      jserror_descriptions << "JS error detected: #{jserror["errorMessage"]} (#{jserror["sourceName"]}:#{jserror["lineNumber"]})"
    end
  rescue Exception => e
    puts "Checking for JS errors failed with: #{e}"
  end
  jserror_descriptions
end

Before do |scenario|
  browser.cookies.clear if browser
  @browser = browser

  # Сохраняем экземпляр сценария
  @sc = scenario
end

AfterConfiguration do |config|
  puts "Конфигурация завершена.."
end

# Проверяем наличие ошибок JS после каждого шага
#AfterStep do |scenario|
#  js_errors = get_js_error_feedback()
#  raise js_errors unless js_errors.empty?
#end

# Записываем изменения URL
def after_step(scenario)
  begin
    # Если url не изменился с прошлого шага, то не выводим его
    unless @last_url == @browser.url
      response_time = @browser.performance.summary[:response_time]/1000
      performance_time_string = 
          "Страница <a href='#{@browser.url}'>#{@browser.url}</a>," +
          " загружена за #{response_time} с, "
      @last_url = @browser.url
    end

    unless @last_step_time.nil?
      step_time = Time.now - @last_step_time
      # Если шаг пройден более чем за 5 секунд - то выделим это в отчете
      if step_time > 10
        step_time = "<font color='red'>%.1f</font>" % step_time
      else
        step_time = "%.1f" % step_time
      end
      puts "DEBUG: #{performance_time_string}шаг пройден за #{step_time} с"
    end
    @last_step_time = Time.now
  rescue Exception => e
    puts "Ошибка действий после шага: #{e.message}"
  end
end

AfterStep do |scenario|
  after_step(scenario)
end

After do |scenario|
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  screenshot = "./screenshots/FAILED_#{(0..8).to_a.map{|a| rand(16).to_s(16)}.join}.png"
  if scenario.failed?
    after_step(scenario)
    begin
      @browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    rescue
      Cucumber.wants_to_quit = true
    end
  end
end

if(FAIL_FAST)
  After do |s|
    Cucumber.wants_to_quit = true if s.failed?
  end
end

at_exit do
  browser.quit if browser
  headless.destroy if HEADLESS
end

# Store all subclasses
class Class
  def subclasses
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end
