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

Given(/^I set up fabrication$/) do
  # set fabrication as a fixture replacement
  copy '%/fabrication.rb', 'config/initializers/fabrication.rb'
end
