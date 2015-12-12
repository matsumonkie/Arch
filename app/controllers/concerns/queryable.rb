# disable authenticity token when making call from /as/some_type in development
module Queryable

  extend ActiveSupport::Concern

  included do
    skip_before_filter :verify_authenticity_token, if: ->() {
      Rails.env.development? && easy_query?
    }
    skip_before_filter :authorize, if: ->() {
      Rails.env.development? && easy_query?
    }
  end

  def easy_query?
    action == :as && model == :easy_query
  end
end
