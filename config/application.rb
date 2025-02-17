require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Observatoire
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Europe/Paris"
    # config.eager_load_paths << Rails.root.join("extras")

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        address: "smtp-relay.brevo.com",
        port: 587,
        user_name: ENV['SMTP_USER'],
        password: ENV['SMTP_PASSWORD'],
        authentication: :plain
    }

    # TODO Remove when kamifusen is compatible with Vips
    config.active_storage.variant_processor = :mini_magick
    # Need for +repage, because of https://github.com/rails/rails/commit/b2ab8dd3a4a184f3115e72b55c237c7b66405bd9
    config.active_storage.supported_image_processing_methods = ["+"]
    config.active_storage.service_urls_expire_in = 1.hour

    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.system_tests = nil
      generate.orm :active_record, primary_key_type: :uuid
    end

    config.sass.preferred_syntax = :sass
  end
end
