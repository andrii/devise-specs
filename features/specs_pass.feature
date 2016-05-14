Feature: Specs pass

  Background:
    Given I set up devise-specs

  Scenario: specs pass with Factory Girl installed
    Given I install factory_girl_rails
      And I run `rails generate devise Member`
      And I set up devise
    When I run `bundle exec rspec spec/features`
    Then the examples should all pass

  Scenario: specs pass with Fabrication installed
    Given I install fabrication
      And I run `rails generate devise Member`
      And I set up devise
    When I run `bundle exec rspec spec/features`
    Then the examples should all pass
