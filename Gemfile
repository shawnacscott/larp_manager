source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4", ">= 7.0.4.1"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# User authentication [https://github.com/heartcombo/devise]
gem "devise"

# Workflow builder [https://github.com/collectiveidea/interactor-rails]
gem "interactor-rails"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Authorization system [https://github.com/varvet/pundit]
gem "pundit"

gem "sprockets-rails", require: "sprockets/railtie"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # Static analysis security scanner [https://github.com/presidentbeef/brakeman]
  gem "brakeman"

  # Security linting for dependencies [https://github.com/rubysec/bundler-audit]
  gem "bundler-audit"

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]

  # Application runner -- this doesn't like to be installed via bundler, but it's needed for Code Sandbox
  gem "foreman"

  # Scan dependencies for compatible licensing [https://github.com/pivotal/LicenseFinder]
  gem "license_finder"

  # Code Metric Tooling [https://github.com/flyerhzm/rails_best_practices]
  gem "rails_best_practices"

  # Rails testing framework [https://github.com/rspec/rspec-rails]
  gem "rspec-rails"

  # Ruby style guide, linter, and formatter [https://github.com/testdouble/standard]
  gem "standard"
end

group :development do
  # Annotate models with database attributes
  gem "annotate"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler"

  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end
