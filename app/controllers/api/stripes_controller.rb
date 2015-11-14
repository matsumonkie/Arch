class Api::StripesController < ApplicationController

  def create
    render_for StripeOp.create(params)
  end

  def destroy
    render_for StripeOp.delete(params)
  end
end
