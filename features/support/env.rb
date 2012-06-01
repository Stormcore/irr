# encoding: utf-8
BASE_URL = ENV['BASE_URL'] || "http://irr.ru"
HEADLESS = ENV['HEADLESS'] || false
DRIVER = (ENV['WEB_DRIVER'] || :firefox).to_sym
ENABLE_FLASH = ENV['FLASH'] || false
FAIL_FAST = ENV['FAILFAST'] || false


require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'nokogiri'
require 'debugger'
require 'net/http'
require 'uri'
require 'date'
require 'unicode_utils/downcase'
require 'cucumber/formatter/unicode'


$: << File.dirname(__FILE__)+'/../../lib'
require 'pages.rb'

World PageObject::PageFactory

if HEADLESS
  puts "Starting xvfb.."
  require 'headless'
  headless = Headless.new
  headless.start
end

def start_browser
  case DRIVER
  when :firefox
    puts "Starting firefox..."
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 240
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile.native_events = false
    profile['toolkit.telemetry.prompted'] = true
    profile['plugin.click_to_play'] = true unless ENABLE_FLASH
    profile.add_extension "features/support/JSErrorCollector.xpi"
    profile.add_extension "features/support/flashblock.xpi" unless ENABLE_FLASH
    browser = Watir::Browser.new(DRIVER, :profile => profile, :http_client => client)
    
  when :chrome
    puts "Starting chrome"
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 240
    profile = Selenium::WebDriver::Chrome::Profile.new
    switches  = %w[--bwsi]
    browser = Watir::Browser.new(DRIVER, :profile => profile, :http_client => client, :switches => switches)
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
  @browser.cookies.clear if @browser
  @browser = browser
  
  # Сохраняем экземпляр сценария
  @sc = scenario
end

AfterConfiguration do |config|
  puts "Tests have been configured, starting up.."
end

# Проверяем наличие ошибок JS после каждого шага
#AfterStep do |scenario|
#  js_errors = get_js_error_feedback()
#  raise js_errors unless js_errors.empty?
#end

After do |scenario|
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  screenshot = "./screenshots/FAILED_#{(0..8).to_a.map{|a| rand(16).to_s(16)}.join}.png"
  if scenario.failed?
    begin
      @browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    rescue Timeout::Error
      @browser.quit
      @browser = start_browser
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
