require 'cucumber'
require 'cucumber/rake/task'

# Automatic rerun stuff
def run_rake_task(name)
  begin
    Rake::Task[name].execute
  rescue Exception => e
    return false
  end
  true
end

Cucumber::Rake::Task.new(:rerun) do |task|
  unless File.exist?('rerun.txt')
    File.open('rerun.txt', 'w+').close
  end
  ENV['FEATURE'] = ''
  task.cucumber_opts = ["HEADLESS=true",
                        "@rerun.txt",
                        "-r features",
                        "--format junit --out junit",
                        "--format html  --out cucumber_rerun.html",
                        "--format pretty"]
end

Cucumber::Rake::Task.new(:compile) do |task|
  task.cucumber_opts = ["WEB_DRIVER=none",
                        "-t @compile",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format pretty",
                        "features"]
end

Cucumber::Rake::Task.new(:wip_no_rerun) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "-t @wip",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format rerun --out rerun.txt",
                      "--format pretty",
                      "features"]
end

task :wip do
  selenium_successful = run_rake_task("wip_no_rerun")
  rerun_successful = true
  unless selenium_successful
    puts "\n\n Rerunning failed tests"
    rerun_successful = run_rake_task("rerun")
  end
  unless selenium_successful || rerun_successful
    fail 'Cucumber tests failed'
  end
end

Cucumber::Rake::Task.new(:tag_no_rerun) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "-r features",
                      "-t @#{ENV['TAG'] || "all"}",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format rerun --out rerun.txt",
                      "--format pretty"]
end

task :tag do
  selenium_successful = run_rake_task("tag_no_rerun")
  rerun_successful = true
  unless selenium_successful
    puts "\n\n Rerunning failed tests"
    rerun_successful = run_rake_task("rerun")
  end
  unless selenium_successful || rerun_successful
    fail 'Cucumber tests failed'
  end
end

Cucumber::Rake::Task.new(:bug_no_rerun) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "FAILFAST=true",
                      "-r features",
                      "-t @bug#{ENV['BUG']}",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format rerun --out rerun.txt",
                      "--format pretty"]
end

task :bug do
  selenium_successful = run_rake_task("bug_no_rerun")
  rerun_successful = true
  unless selenium_successful
    puts "\n\n Rerunning failed tests"
    rerun_successful = run_rake_task("rerun")
  end
  unless selenium_successful || rerun_successful
    fail 'Cucumber tests failed'
  end
end

Cucumber::Rake::Task.new(:fast_category_check_no_rerun) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "-r features",
                      "-t @all_results,@customfield",
                      "-t ~@wip -t ~@bugs",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format rerun --out rerun.txt",
                      "--format pretty"]
end

task :fast_category_check do
  selenium_successful = run_rake_task("fast_category_check_no_rerun")
  rerun_successful = true
  unless selenium_successful
    puts "\n\n Rerunning failed tests"
    rerun_successful = run_rake_task("rerun")
  end
  unless selenium_successful || rerun_successful
    fail 'Cucumber tests failed'
  end
end

Cucumber::Rake::Task.new(:feature_no_rerun) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "-r features",
                      "-t ~@wip -t ~@bugs",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format rerun --out rerun.txt",
                      "--format pretty",
                      ENV['FEATURE']]
end

task :feature do
  selenium_successful = run_rake_task("feature_no_rerun")
  rerun_successful = true
  unless selenium_successful
    puts "\n\n Rerunning failed tests"
    rerun_successful = run_rake_task("rerun")
  end
  unless selenium_successful || rerun_successful
    fail 'Cucumber tests failed'
  end
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
