module Activable
  extend ActiveSupport::Concern

  included do
    field :confirmation_token, type: String, default: ->() { SecureRandom.hex(16) }
    field :activated, type: Boolean, default: false
  end

  def status
    if not(activated)
      :unconfirmed
    elsif respond_to?(:expired?) && expired?
      :expired
    elsif respond_to?(:closed) && closed
      :closed
    else
      :active
    end
  end

  def signable?
    [:unconfirmed, :active].include?(status())
  end
end
