Given(/^I set up devise\-specs$/) do
  run_simple 'gem install rails --no-ri --no-rdoc'
  run_simple 'rails new . --skip-spring'

  append_to_file 'Gemfile', <<~RUBY
    gem 'devise'
    gem 'devise-specs', path: '../..'
    gem 'rspec-rails'
    gem 'capybara'
  RUBY

  # define root route
  copy '%/routes.rb', 'config/routes.rb'

  run_simple 'bundle install'
  run_simple 'rails generate rspec:install'
  run_simple 'rails generate devise:install'
end

Given(/^I install (.*)$/) do |gem|
  append_to_file 'Gemfile', "gem '#{gem}'\n"

  run_simple 'bundle install'
end

Given(/^I set up devise$/) do
  run_simple 'rake db:migrate RAILS_ENV=test'
  run_simple 'rails generate controller Home index'

  # insert flash messages
  copy '%/application.html.erb', 'app/views/layouts/application.html.erb'

  # insert authentication links
  copy '%/index.html.erb', 'app/views/home/index.html.erb'

  # configure action_mailer host
  copy '%/action_mailer.rb', 'config/initializers/action_mailer.rb'
end
