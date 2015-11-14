module Stripeable
  extend ActiveSupport::Concern

  included do
    field :stripe_id, type: String
    field :last_four_digits, type: String
  end
end
