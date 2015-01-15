class DemoUsersController < ApplicationController

  skip_before_filter :authorize, :only => :update

  def update
    render json: DemoUserOp.update(params)
  end
end
