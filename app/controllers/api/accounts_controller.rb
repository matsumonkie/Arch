class Api::AccountsController < ApplicationController

  def close
    render_for AccountOp.close(params)
  end

  def reopen
    render_for AccountOp.reopen(params)
  end

  def destroy
    render_for AccountOp.delete(params)
  end
end
