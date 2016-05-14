Rails.application.configure do
  config.generators do |g|
    g.fixture_replacement :fabrication
  end
end
