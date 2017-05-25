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
    config.action_mailer.default_url_options = {host: '184.173.153.201'}

    config.action_mailer.delivery_method = :smtp
    # SMTP settings for gmail
    config.action_mailer.smtp_settings = {
        :address              => "smtp.mailgun.org",
        :port                 => 587,
        :user_name            => "postmaster@sandbox88527bb0d4fa4ce7a08456157e47c8da.mailgun.org",
        :password             => "a79ba1f7f509e621847ecd2c0de08b41",
        :authentication       => "plain",
    }
  end
end
