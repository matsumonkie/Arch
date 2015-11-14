module Passwordable
  extend ActiveSupport::Concern

  included do
    field :encrypted_password, type: String, default: ""
    field :salt, type: String
  end
end
