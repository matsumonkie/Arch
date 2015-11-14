# this is needed when we want to make api
# requests after a save_and_open_page with capybara
module Capybarable
  extend ActiveSupport::Concern

  included do
    before_filter :allow_cors, if: ->() { Rails.env.development? }
  end

  def allow_cors
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
    headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
  end
end
