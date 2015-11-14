class Api::Admin::UsersController < ApplicationController

  def index
    users = UserOp.index(params)
    render json: users
  end

  def create
    render_for UserOp.create(params)
  end

  def update_hr
    render_for UserOp.update_hr_as_admin(params)
  end

  def update
    render_for UserOp.update_as_admin(params)
  end

  def destroy
    render_for UserOp.delete(params)
  end
end
