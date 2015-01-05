# Be sure to restart your server when you modify this file.

# this is causing a bug with devise/mongoid/warden
Rails.application.config.action_dispatch.cookies_serializer = :json
