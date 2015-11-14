require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Arch
  class Application < Rails::Application

    app_load_paths = Dir.glob("app/**/")
    lib_load_paths = Dir.glob("lib/")
    load_paths = app_load_paths + lib_load_paths
    load_paths.each { |path| config.autoload_paths << Rails.root.join(path) }

    config.quiet_assets_paths << '/__meta_request/' if Rails.env.development?

    config.middleware.use Rack::Attack
  end
end
