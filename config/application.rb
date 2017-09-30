require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Terminal
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those
    # specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "Asia/Tokyo"
    config.i18n.load_path += Dir[Rails.root.join("config",
      "locales", "**", "*.{rb,yml}").to_s]
    config.i18n.default_locale = :en

    config.autoload_paths += %W(#{config.root}/lib)

    config.generators do |g|
      g.test_framework :rspec
      g.fixtures true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
      g.controller_specs false
      g.view_specs false
      g.helper_specs false
      g.routing_specs false
      g.request_specs false
    end
  end
end
