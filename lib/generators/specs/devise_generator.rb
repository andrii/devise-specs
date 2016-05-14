module Specs
  module Generators
    class DeviseGenerator < Rails::Generators::Base
      ATTRIBUTES = %(
        email 'username@example.com'
        password 'password')

      source_root File.expand_path("../templates", __FILE__)

      def require_supporting_files
        uncomment_lines 'spec/rails_helper.rb', /spec.support.*rb.*require/
      end

      def insert_fixture_replacement_attributes
        path  = 'spec/factories/users.rb'
        attrs = ATTRIBUTES.gsub(/^ {4}/, '')
        after = 'factory :user do'

        insert_into_file path, attrs, after: after
      end

      def create_factory_girl_config_file
        template 'factory_girl.rb', 'spec/support/factory_girl.rb'
      end

      def create_helpers_file
        template 'helpers.rb', 'spec/support/helpers.rb'
      end

      def create_specs
        template 'resource_signs_up_spec.rb',
                 'spec/features/user_signs_up_spec.rb'

        template 'resource_signs_in_spec.rb',
                 'spec/features/user_signs_in_spec.rb'

        template 'resource_signs_out_spec.rb',
                 'spec/features/user_signs_out_spec.rb'

        template 'resource_resets_password_spec.rb',
                 'spec/features/user_resets_password_spec.rb'
      end
    end
  end
end
