require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:compile) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                        "-t @compile",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty",
                        "features"]
end

Cucumber::Rake::Task.new(:wip) do |task|
    task.cucumber_opts = ["HEADLESS=true",
                        "-t @compile,@wip",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty",
                        "features"]
end

Cucumber::Rake::Task.new(:failing) do |task|
    task.cucumber_opts = ["HEADLESS=true",
                        "-r features",
                        "-t @compile,@failing",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty"]
end

Cucumber::Rake::Task.new(:tag) do |task|
    task.cucumber_opts = ["HEADLESS=true",
                        "-r features",
                        "-t @#{ENV['TAG'] || "all"}",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty"]
end

Cucumber::Rake::Task.new(:bug) do |task|
    task.cucumber_opts = ["HEADLESS=true",
                        "FAILFAST=true",
                        "-r features",
                        "-t @#{ENV['BUG']}",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty"]
end

Cucumber::Rake::Task.new(:feature) do |task|
    task.cucumber_opts = ["HEADLESS=true",
                        "#{ENV['FEATURE']}",
                        "-r features",
                        "-t ~@wip -t ~@bugs",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty"]
end

Cucumber::Rake::Task.new(:all) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "-t @compile,~@wip",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format pretty",
                      "features"]
end

task :default => :all
