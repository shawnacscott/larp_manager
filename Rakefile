# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"
require "standard/rake"

Rails.application.load_tasks

# https://talariasoftware.com/articles/default_rake_task
task default: %i[
  standard:fix
  spec
  rails_best_practices
  license_finder
  brakeman:check
  bundle:audit:update
]
