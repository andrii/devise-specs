Feature: Skip specs

  Background:
    Given I set up devise-specs

  Scenario: running a devise generator with --skip-specs
    When I run `bin/rails generate devise User --skip-specs`
    Then the output should not contain "invoke  specs"

  Scenario: running a devise generator with --no-specs
    When I run `bin/rails generate devise User --no-specs`
    Then the output should not contain "invoke  specs"
