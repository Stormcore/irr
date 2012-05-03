require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:all_tests) do |task|
  task.cucumber_opts = ["--format pretty", "features"]
end

Cucumber::Rake::Task.new(:html) do |task|
  task.cucumber_opts = ["--format html", "--out cucumber.html", "features"]
end

Cucumber::Rake::Task.new(:run) do |task|
  task.cucumber_opts = ["-t", "@#{ENV["TAG"] || "all" }", "features"]
end

Cucumber::Rake::Task.new(:compile) do |task|
  task.cucumber_opts = ["-t","@compile","features"]
end

Cucumber::Rake::Task.new(:compile_headless) do |task|
  task.cucumber_opts = ["HEADLESS", "-t @compile", "--format junit", "--out junit", "features"]
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = ["-t", "@wip", "features"]
end

Cucumber::Rake::Task.new(:wip_html) do |task|
  task.cucumber_opts = ["-t", "@wip", "features", "--format html", "--out cucumber.html",]
end

Cucumber::Rake::Task.new(:stable) do |task|
  task.cucumber_opts = ["-t", "~@wip", "features", "--format html", "--out cucumber.html",]
end

task :default => :all_tests
