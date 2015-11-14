class Api::AvatarsController < ApplicationController

  def update
    render_for AvatarOp.update(params)
  end
end
