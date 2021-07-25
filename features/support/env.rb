require 'aruba/cucumber'

Aruba.configure do |config|
  config.exit_timeout = 240
end

Before do
  delete_environment_variable 'BUNDLE_GEMFILE'
end
