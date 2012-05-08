require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:compile) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                        "-t @compile",
                        "--format json  --out cucumber.json",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty",
                        "features"]
end

Cucumber::Rake::Task.new(:wip) do |task|
    task.cucumber_opts = ["HEADLESS=true",
                        "-t @compile,@wip",
                        "--format json  --out cucumber.json",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty",
                        "features"]
end

Cucumber::Rake::Task.new(:failing) do |task|
    task.cucumber_opts = ["HEADLESS=true",
                        "-t @compile -t @failing",
                        "--format json  --out cucumber.json",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty",
                        "features"]
end

Cucumber::Rake::Task.new(:tag) do |task|
    task.cucumber_opts = ["HEADLESS=true",
                        "-t @compile, @#{ENV['TAG'] || "all"}",
                        "--format json  --out cucumber.json",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty",
                        "features"]
end

Cucumber::Rake::Task.new(:feature) do |task|
    task.cucumber_opts = ["HEADLESS=true",
                        "#{ENV['FEATURE']}",
                        "-r features",
                        "-t @compile -t ~@wip -t ~@bugs",
                        "--format json  --out cucumber.json",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty"]
end

Cucumber::Rake::Task.new(:all) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "-t @compile,~@wip",
                      "--format json  --out cucumber.json",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format pretty",
                      "features"]
end

task :default => :all_tests
