ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'sidekiq/testing'

Capybara.javascript_driver = :webkit
Capybara.asset_host = "http://localhost:3000"

# Add additional requires below this line. Rails is not loaded until this point!

require 'simplecov'
if ENV["COVERAGE"]
  SimpleCov.start do
    add_filter '/spec/'
    add_filter '/serializers/'

    add_group "Models"      ,"app/models"
    add_group "Controllers" ,"app/controllers"
    add_group "Operations"  ,"app/operations"
    add_group "Roles"       ,"app/roles"
    add_group "Forms"       ,"app/forms"
    add_group "Validators"  ,"app/validators"
    add_group "Services"    ,"app/services"
  end
end
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include SessionHelpers
  config.infer_spec_type_from_file_location!
end
