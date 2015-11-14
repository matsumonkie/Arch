module Expireable
  extend ActiveSupport::Concern

  included do
    field :expire_at, type: Date, default: ->() { Date.today + 1.year }
  end

  def expired?
    expire_at < Date.today
  end

  def postpone_account_expiration(duration = 1.year)
    date =
      if expired?
        Date.today + duration
      else
        expire_at + duration
      end
    update_attribute(:expire_at, date)
  end
end
