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

Cucumber::Rake::Task.new(:compile) do |task|
  task.cucumber_opts = ["WEB_DRIVER=none",
                        "-t @compile",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format json  --out cucumber.json",
                        "--format pretty --color",
                        "features"]
end

Cucumber::Rake::Task.new(:wip_no_rerun) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "-t @wip",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format json  --out cucumber.json",
                      "--format rerun --out rerun.txt",
                      "--format pretty --color",
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
                      "--format json  --out cucumber.json",
                      "--format rerun --out rerun.txt",
                      "--format pretty --color"]
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
                      "--format json  --out cucumber.json",
                      "--format rerun --out rerun.txt",
                      "--format pretty --color"]
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
                      "--format json  --out cucumber.json",
                      "--format rerun --out rerun.txt",
                      "--format pretty --color"]
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

Cucumber::Rake::Task.new(:advert_submit_no_rerun) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "-r features",
                      "-t ~@wip -t ~@bugs -t @advert_submit",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format json  --out cucumber.json",
                      "--format rerun --out rerun.txt",
                      "--format pretty --color",
                      ENV['FEATURE']]
end

task :advert_submit do
  selenium_successful = run_rake_task("advert_submit_no_rerun")
  rerun_successful = true
  unless selenium_successful
    puts "\n\n Rerunning failed tests"
    rerun_successful = run_rake_task("rerun")
  end
  unless selenium_successful || rerun_successful
    fail 'Cucumber tests failed'
  end
end

Cucumber::Rake::Task.new(:after_index_no_rerun) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "-r features",
                      "-t ~@wip -t ~@bugs -t @after_index",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format json  --out cucumber.json",
                      "--format rerun --out rerun.txt",
                      "--format pretty --color",
                      ENV['FEATURE']]
end

task :after_index do
  selenium_successful = run_rake_task("after_index_no_rerun")
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
                      "--format json  --out cucumber.json",
                      "--format rerun --out rerun.txt",
                      "--format pretty --color",
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

Cucumber::Rake::Task.new(:feature_ignore_bug_no_rerun) do |task|
  task.cucumber_opts = ["HEADLESS=true",
                      "-r features",
                      "-t ~@wip",
                      "--format junit --out junit",
                      "--format html  --out cucumber.html",
                      "--format json  --out cucumber.json",
                      "--format rerun --out rerun.txt",
                      "--format pretty --color",
                      ENV['FEATURE']]
end

task :feature_ignore_bug do
  selenium_successful = run_rake_task("feature_ignore_bug_no_rerun")
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
                      "--format json  --out cucumber.json",
                      "--format pretty --color",
                      "features"]
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
                        "--format json  --out cucumber_rerun.json",
                        "--format pretty --color"]
end

task :default => :all
