class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_current_user, :authorize

  def set_current_user
    @current_user ||= warden.authenticate(scope: :user) || Visitor.new
  end

  def model
    controller_name.capitalize.to_sym
  end

  def authorize
    user = Ability.new(current_user)
    unless user.can?(action_name.to_sym, model())
      raise ArgumentError
    end
  end
end
