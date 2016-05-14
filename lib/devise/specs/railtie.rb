module Devise
  module Specs
    class Railtie < Rails::Railtie
      generators do
        require 'generators/devise/devise_generator'

        Devise::Generators::DeviseGenerator.hook_for :specs, type: :boolean, default: true
      end
    end
  end
end
