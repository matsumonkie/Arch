class Api::SessionsController < ApplicationController

  include Sessionable

  def create
    user = SessionOp.create(params)
    if user.valid?
      session[:locale] = user.locale
      create_session(user._id)
    end
    render_for user
  end

  def destroy
    destroy_session()
    render_for Visitor.new
  end

  protected

  def destroy_session
    session[:user_id] = nil
  end
end
