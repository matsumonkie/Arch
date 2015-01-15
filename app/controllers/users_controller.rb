class UsersController < ApplicationController

  def index
    @users = UserOp.index(params)
    respond_with @users
  end

  def show
    @user = UserOp.show(params)
  end

  def edit
    @user = UserOp.edit(params)
  end

  def update
    redirect_to action: :show, id: UserOp.update(params).id
  end

  def current
    render json: current_user
  end
end
