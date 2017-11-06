require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Flashcards
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    #paperclip S3 
    config.paperclip_defaults = {
    storage: :s3,
    s3_region: 'eu-central-1',
    s3_host_name: 's3-eu-central-1.amazonaws.com',
    s3_credentials: {
      bucket: 'flashcards42',
      access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
      }
    }
  end
end
