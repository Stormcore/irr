BASE_URL = ENV['BASE_URL'] || "http://irr.ru"
KEEP_OPEN = ENV['KEEP_OPEN'] || false
HEADLESS = ENV['HEADLESS'] || false
DRIVER = (ENV['WEB_DRIVER'] || :firefox).to_sym


require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'nokogiri'
require 'debugger'
require 'net/http'
require 'uri'
require 'date'
require 'pp'


$: << File.dirname(__FILE__)+'/../../lib'
require 'pages.rb'

World PageObject::PageFactory

if HEADLESS
  puts "Starting xvfb.."
  require 'headless'
  headless = Headless.new
  headless.start
end

puts "Starting webdriver.."
client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 180

if DRIVER ==:firefox
  puts "Setting up firefox profile..."
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.native_events = false
  profile['toolkit.telemetry.prompted'] = true
end

browser = Watir::Browser.new(DRIVER, :profile => profile, :http_client => client)

Before do |scenario|
  browser.cookies.clear
  @browser = browser
end

AfterConfiguration do |config|
  puts "Tests have been configured, starting up.."
end

After do |scenario|
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_')}.png"
  if scenario.failed?
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end

  #Keep browser open for pending steps
  KEEP_OPEN = true if scenario.status == :pending or scenario.status == :undefined
end

at_exit do
  browser.close if not KEEP_OPEN
  headless.destroy if HEADLESS
end

# Patch Element class to have 'element.should be_shown' instead of 'be_exists'
module Watir
  class Element
    alias_method :shown?, :exists?
  end
end
