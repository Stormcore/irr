Dir["#{File.dirname(__FILE__)}/controls/**/*_control.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/pages/**/*_page.rb"].each {|r| load r }