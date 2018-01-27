require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoManager
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.action_mailer.default_url_options = { :host => "localhost:3000" }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 25,
    :domain => "gmail.com",
    :authentication => :login,
    :user_name => "TodoManagerPswd@gmail.com",
    :password => "990208Todo"
    }
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
