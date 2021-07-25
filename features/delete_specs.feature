Feature: Delete specs

  Background:
    Given I set up devise-specs

  Scenario: undo changes with Factory Bot installed
    Given I install factory_bot_rails
    When I run `bin/rails destroy devise User`
    Then the output should contain:
      """
            invoke  specs
            remove    spec/support/factory_bot.rb
            remove    spec/support/devise.rb
            remove    spec/features/user_signs_up_spec.rb
            remove    spec/features/user_signs_in_spec.rb
            remove    spec/features/user_signs_out_spec.rb
            remove    spec/features/user_resets_password_spec.rb
      """

  Scenario: undo changes with Fabrication installed
    Given I install fabrication
    When I run `bin/rails destroy devise User`
    Then the output should contain:
      """
            invoke  specs
            remove    spec/support/devise.rb
            remove    spec/features/user_signs_up_spec.rb
            remove    spec/features/user_signs_in_spec.rb
            remove    spec/features/user_signs_out_spec.rb
            remove    spec/features/user_resets_password_spec.rb
      """
