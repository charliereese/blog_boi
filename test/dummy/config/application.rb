require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "blog_boi"
require "active_storage/engine"

ActiveStorage::Engine.config
.active_storage
.content_types_to_serve_as_binary
.delete('image/svg+xml')

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Whitelist example.com for testing
    # Read for more: https://www.fngtps.com/2019/rails6-blocked-host/
    config.hosts << "www.example.com"
    config.hosts << "127.0.0.1"


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

