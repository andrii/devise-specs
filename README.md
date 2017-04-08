# devise-specs

[![Build Status](https://travis-ci.org/andrii/devise-specs.svg?branch=master)](https://travis-ci.org/andrii/devise-specs)
[![Code Climate](https://codeclimate.com/github/andrii/devise-specs/badges/gpa.svg)](https://codeclimate.com/github/andrii/devise-specs)

devise-specs is a Rails generator that adds the Devise authentication acceptance tests when you run the `devise` generator. The tests are RSpec feature specs containing Factory Girl or Fabrication fixture replacement methods and Capybara actions.

Generated feature specs test the following features:
* Registration
* Login
* Logout
* Password reset

Works with Rails 4 and 5.

## Installation

Specify the required dependencies in a `Gemfile`:
```ruby
gem 'devise'

group :development do
  gem 'devise-specs'
end

group :test do
  gem 'capybara'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails' # or: gem 'fabrication'
end
```

and then run `bundle install`.

## Setup

Generate the RSpec configuratoin files:
```
$ rails generate rspec:install
```

Generate the Devise configuration files and follow the setup instructions:
```
$ rails generate devise:install
```

Configure the Action Mailer URL options for the test environment using the following line in `config/environments/test.rb`:
```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3001 }
```

Add the authentication links to the layout, `user_signed_in?` should be `admin_signed_in?` if your Devise model is `Admin`:
```erb
<% if user_signed_in? %>
  <%= link_to 'Sign Out', destroy_user_session_path, method: :delete %>
<% else %>
  <%= link_to 'Sign In', new_user_session_path %>
  <%= link_to 'Sign Up', new_user_registration_path %>
<% end %>
```

## Usage

Specs are created automatically when you generate a Devise model, e.g. `User`:
```
$ rails generate devise User
         ...
      invoke  specs
        gsub    spec/rails_helper.rb
      insert    spec/factories/users.rb
      create    spec/support/factory_girl.rb
      create    spec/support/devise.rb
      create    spec/features/user_signs_up_spec.rb
      create    spec/features/user_signs_in_spec.rb
      create    spec/features/user_signs_out_spec.rb
      create    spec/features/user_resets_password_spec.rb
```

If a Devise model is already present, run the `devise:specs` generator directly:
```
$ rails generate devise:specs User
```

Run the migrations:
```
$ rake db:migrate RAILS_ENV=test
```

Make sure the specs pass:
```
$ rspec spec/features
.........

Finished in 1.08 seconds (files took 2.1 seconds to load)
9 examples, 0 failures
```

## Documentation

Visit the [Relish docs](https://relishapp.com/andrii/devise-specs/docs) for all the available features and examples of the generated feature specs.

## Output

`gsub    spec/rails_helper.rb`

Uncomments the line that auto-requires all files in the support directory.

`insert    spec/fabricators/*_fabricator.rb`

Adds `email` and `password` attributes to the fabricator.

`insert    spec/factories/*.rb`

Adds `email` and `password` attributes to the factory.

`create    spec/support/factory_girl.rb`

Includes `FactoryGirl::Syntax::Methods` into RSpec config to avoid prefacing Factory Girl methods with `FactoryGirl`.

`create    spec/support/devise.rb`

Includes Devise integration test helpers into feature specs.

`create    spec/features/*_spec.rb`

Generates a corresponding feature spec.

## Testing

Install Ruby, development tools, Nokogiri, SQLite and JavaScript runtime system dependencies.

On Ubuntu/Mint/Debian:
```
$ apt-get install ruby-full build-essential zlib1g-dev libsqlite3-dev nodejs
```

Install development dependencies with `bundle install` and run the tests: 
```
$ bundle exec rake
```

## License

MIT License
