Given(/^I set up devise\-specs$/) do
  run_command_and_stop 'rails new . --skip-spring'

  append_to_file 'Gemfile', <<~RUBY
    gem 'devise'
    gem 'devise-specs', path: '../..'
    gem 'rspec-rails'
  RUBY

  # define root route
  copy '%/routes.rb', 'config/routes.rb'

  run_command_and_stop 'bundle install'
  run_command_and_stop 'bin/rails generate rspec:install'
  run_command_and_stop 'bin/rails generate devise:install'
end

Given(/^I install (.*)$/) do |gem|
  append_to_file 'Gemfile', "gem '#{gem}'\n"

  run_command_and_stop 'bundle install'
end

Given(/^I set up devise$/) do
  run_command_and_stop 'bin/rails db:migrate RAILS_ENV=test'
  run_command_and_stop 'bin/rails generate controller Home index'

  # insert flash messages
  copy '%/application.html.erb', 'app/views/layouts/application.html.erb'

  # insert authentication links
  copy '%/index.html.erb', 'app/views/home/index.html.erb'

  # configure action_mailer host
  copy '%/action_mailer.rb', 'config/initializers/action_mailer.rb'
end
