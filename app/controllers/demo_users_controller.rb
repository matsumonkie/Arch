class DemoUsersController < ApplicationController

  def update
    DemoUserOp.update(params)
    render json: true
  end
end
