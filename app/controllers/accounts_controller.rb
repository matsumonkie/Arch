class AccountsController < ApplicationController

  include Sessionable

  protect_from_forgery :except => [:reset_password]

  def confirm
    @user = AccountOp.confirm(params)
    render_forbidden unless @user
  end

  def activate
    @user = AccountOp.activate(params)
    if @user.valid?
      create_session(@user.id)
      redirect_to root_url + "d/#/users/#{@user.id}"
    else
      render :confirm
    end
  end

  def reset_password
    @user = AccountOp.reset_password(params)
    if @user.valid?
      redirect_to root_url, notice: I18n.t('account.reseted')
    else
      redirect_to root_url, alert: I18n.t('account.not_found')
    end
  end
end
