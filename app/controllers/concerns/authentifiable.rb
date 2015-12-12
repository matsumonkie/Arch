module Authentifiable

  extend ActiveSupport::Concern

  included do
    before_filter :set_current_user
  end

  def set_current_user
    @current_user ||= current_user()
  end

  def current_user
    if session[:user_id]
      user = User.find(session[:user_id])
      if user
        user
      else
        reset_session
        Visitor.new()
      end
    else
      Visitor.new
    end
  end

  def signed_in?
    !!session[:user_id]
  end

  def me?(user_id)
    @current_user.id.to_s == user_id
  end
end
