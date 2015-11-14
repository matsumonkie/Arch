module Localeable
  extend ActiveSupport::Concern

  included do
    field :locale, type: String, default: 'fr'
  end
end
