class Api::UsersController < ApplicationController

  def index
    render_for UserOp.index(params)
  end

  def update_email
    res =
      UserOp.update_email(params)
    render_for res
  end
end
