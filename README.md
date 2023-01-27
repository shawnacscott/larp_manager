# LARP Manager

[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

Hacakthon LARP manager thingy

# Setup
Must have installed:
* Heroku toolchain? # TODO: Check if this is used yet? We may need eventually if we use Heroku.
* Ruby 3.2.0
* Redis? # TODO: Check if this is used yet? We'll definitely need it eventually.
* Postgres 15

# Local testing, linting, style guide, and autoformatting
```
rake
```

# Gems
## Gems we chose to add to the app that you should probably read about how to use
* [Devise](https://github.com/heartcombo/devise) - User authentication. Devise offers us handling of all common sign up/sign in tasks, including password recovery. It also gives us access to a `current_user` object everywhere in the application. We have chosen to serparate auth concerns from domain model concerns by relying on Devise's `User` model solely for authentication, while basing app use off of the custom `Profile` model.
* [Interactor](https://github.com/collectiveidea/interactor)/[Interactor-Rails](https://github.com/collectiveidea/interactor-rails) - Workflow standardization & composition. Interactors and their related organizers allow us to create and connect small amounts of functionality as service objects in a standardized way.
* [Pundit](https://github.com/varvet/pundit) - User authorization.

To be added:
* [Rolify](https://github.com/RolifyCommunity/rolify) ([other helpful notes](https://github.com/RolifyCommunity/rolify/wiki/Usage))
* [RSpec](https://github.com/rspec/rspec-rails)
* <some kind of linting, maybe rubocop or standardrb>

## Gems we chose to add that you don't really need to think about
# TODO: Add gems for testing/static analysis
* [Annotate](https://github.com/ctran/annotate_models) - Automatically generates and adds schema information comments to model classes when running `bin/rails db:migrate`

## Gems installed by Rails at initial setup
### Production
* [cssbundling-rails](https://github.com/rails/cssbundling-rails) - Bundle and process CSS
* [jsbundling-rails](https://github.com/rails/jsbundling-rails) - Bundle and transpile JavaScript
* pg - Use postgresql as the database for Active Record
* [puma](https://github.com/puma/puma) - Use the Puma web server
* sprockets-rails - Asset pipeline
* tzinfo-data - Windows does not include zoneinfo files, so bundle the tzinfo-data gem

### Development and/or test
* debug - See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
* [rack-mini-profiler](https://github.com/MiniProfiler/rack-mini-profiler) - Add speed badges
* [web-console](https://github.com/rails/web-console) - Use console on exceptions pages

# Helpful gem generators
In these commands, we'll be using the shortened form of the `rails generate` command, `rails g`.
## Pundit
```
bin/rails g pundit:policy <model name>
```

## Interactors
```
bin/rails g interactor <desired interactor name>
bin/rails g interactor:organizer <desired organizer name> <list of existing interactor names, in order>
```

# CI & Deploy
# TODO: (research all of these to see if a good idea first) Set up GitHub branch deployments, Possibly Dockerize for Code Sandbox, set up Code Climate test coverage, set up Dependabot with auto merge, set up New Relic, paper_trail for auditing, administrate for admin UIs, rolify for roles

https://docs.codeclimate.com/docs/configuring-test-coverage#section-quick-guide
https://codesandbox.io/blog/introducing-docker-support-in-codesandbox
https://github.com/paper-trail-gem/paper_trail
https://github.com/thoughtbot/administrate
https://github.com/RolifyCommunity/rolify
https://github.com/paambaati/codeclimate-action


# First time deploy setup
* Set up superuser profiles
* Set up chapters
