class Api::UsersController < ApplicationController

  def index
    render_for UserOp.index(params)
  end

  def update_email
    render_for UserOp.update_email(params)
  end
end
