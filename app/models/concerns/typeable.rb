module Typeable

  extend ActiveSupport::Concern

  def type
    self.class.to_s.underscore.to_sym
  end
end
