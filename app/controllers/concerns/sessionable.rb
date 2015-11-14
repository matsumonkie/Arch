module Sessionable

  extend ActiveSupport::Concern

  def create_session(user_id)
    session[:user_id] = user_id
  end
end
