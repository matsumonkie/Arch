# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ABILITY_FILE = File.read("#{Rails.root}/config/abilities.yml")
