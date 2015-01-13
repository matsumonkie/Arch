class DemoUsersController < ApplicationController

  skip_before_filter :authorize, :only => :update

  def update
    Rails.logger.fatal params

    render json: DemoUserOp.update(params).to_json
  end
end
