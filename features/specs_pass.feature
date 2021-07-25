Feature: Specs pass

  Background:
    Given I set up devise-specs

  Scenario: specs pass with Factory Bot installed
    Given I install factory_bot_rails
      And I run `bin/rails generate devise Member`
      And I set up devise
    When I run `bundle exec rspec spec/features`
    Then the examples should all pass

  Scenario: specs pass with Fabrication installed
    Given I install fabrication
      And I run `bin/rails generate devise Member`
      And I set up devise
    When I run `bundle exec rspec spec/features`
    Then the examples should all pass
