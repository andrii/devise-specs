module Devise
  module Generators
    class SpecsGenerator < Rails::Generators::NamedBase
      ATTRIBUTES = %(
        email { 'username@example.com' }
        password { 'password' }
      ).freeze

      source_root File.expand_path('../templates', __FILE__)

      def require_support_files
        uncomment_lines 'spec/rails_helper.rb', /spec.*support.*rb.*require/
      end

      def insert_fixture_replacement_attributes
        return if behavior == :revoke

        if fixture_replacement == :factory_bot
          insert_factory_bot_attributes
        elsif fixture_replacement == :fabrication
          insert_fabrication_attributes
        end
      end

      def create_factory_bot_config_file
        if fixture_replacement == :factory_bot
          template 'factory_bot.rb', 'spec/support/factory_bot.rb'
        end
      end

      def create_devise_config_file
        template 'devise.rb', 'spec/support/devise.rb'
      end

      def create_specs
        template 'resource_signs_up_spec.rb',
                 "spec/features/#{singular_name}_signs_up_spec.rb"

        template 'resource_signs_in_spec.rb',
                 "spec/features/#{singular_name}_signs_in_spec.rb"

        template 'resource_signs_out_spec.rb',
                 "spec/features/#{singular_name}_signs_out_spec.rb"

        template 'resource_resets_password_spec.rb',
                 "spec/features/#{singular_name}_resets_password_spec.rb"
      end

      private

      def fixture_replacement
        Rails.application.config.generators.rails[:fixture_replacement]
      end

      def insert_factory_bot_attributes
        path  = "spec/factories/#{plural_name}.rb"
        attrs = ATTRIBUTES.gsub(/^ {4}/, '')
        after = "factory :#{singular_name} do"

        insert_into_file path, attrs, after: after
      end

      def insert_fabrication_attributes
        path  = "spec/fabricators/#{singular_name}_fabricator.rb"
        attrs = ATTRIBUTES.gsub(/^ {6}/, '')
        after = "Fabricator(:#{singular_name}) do"

        insert_into_file path, attrs, after: after
      end
    end
  end
end
