# Project-specific configuration for CruiseControl.rb

Project.configure do |project|

  # Build the project by invoking rake task 'custom'
  project.rake_task = 'compile'

  # Set the frequency to poll the repository, to check if there are source control changes
  project.scheduler.polling_interval = 1.hour

  # Set environment variables passed into the build
  project.environment['WEB_DRIVER']='chrome'
  project.environment['BASE_URL']='http://irr.ru'
end
