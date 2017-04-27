require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GestionMaestria
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.raise_in_transactional_callbacks = true

    config.active_job.queue_adapter = :delayed_job
    config.action_mailer.default_url_options = {host: 'ejemplo.com'}

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
    	address: 'localhost',
    	port: 1025
    }
    
  end
end
