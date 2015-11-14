class Api::PasswordsController < ApplicationController

  def update
    render_for PasswordOp.change(params)
  end
end
