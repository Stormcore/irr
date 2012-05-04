require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:all_tests) do |task|
  task.cucumber_opts = ["--format pretty", "features"]
end

Cucumber::Rake::Task.new(:html_headless) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "--format json  --out cucumber.json",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format pretty",
                      "features"]
end

Cucumber::Rake::Task.new(:run, :tag) do |task, args|
  task.cucumber_opts = ["-t", "@#{args['tag'] || all}", "features"]
end

Cucumber::Rake::Task.new(:compile) do |task|
  task.cucumber_opts = ["-t","@compile","features"]
end

Cucumber::Rake::Task.new(:compile_headless) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                        "-t @compile",
                        "--format json  --out cucumber.json",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty",
                        "features"]
end

Cucumber::Rake::Task.new(:wip) do |task|
  task.cucumber_opts = ["-t", "@wip", "features"]
end

Cucumber::Rake::Task.new(:wip_headless) do |task|
    task.cucumber_opts = ["HEADLESS=true",
                        "-t @wip",
                        "--format json  --out cucumber.json",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty",
                        "features"]
end

Cucumber::Rake::Task.new(:feature_headless, :feature) do |task, args|
    task.cucumber_opts = ["HEADLESS=true",
                        "-r features/",
                        "#{args['feature']}",
                        "--format json  --out cucumber.json",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty",
                        "features"]
end

task :default => :all_tests
