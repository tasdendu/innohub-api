# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NewlinApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.time_zone = 'Asia/Dhaka'

    # Enabling devise to render json response.
    config.to_prepare do
      Devise::Mailer.layout 'mailer'
      DeviseController.respond_to :json
    end

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore,
                          key: :_undp_key,
                          httponly: true,
                          secure: Rails.env.production?,
                          expire_after: 7.days,
                          domain: :all,
                          tld_length: 2,
                          redis: {
                            expire_after: 1.week,
                            key_prefix: 'undp:session:',
                            url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1')
                          }

    # Disabling some tests we don't need by default so we can create by hand if it is appropriate.
    config.generators do |g|
      g.test_framework(
        :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
      )
    end
  end
end
