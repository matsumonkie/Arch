class UsersController < ApplicationController

  def index
    @users = UserOp.index(params)
  end

  def show
    @user = UserOp.show(params)
  end

  def edit
    @user = UserOp.edit(params)
  end

  def update
    redirect_to UserOp.update(params)
  end
end
