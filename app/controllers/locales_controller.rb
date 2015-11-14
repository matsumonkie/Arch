class LocalesController < ApplicationController

  skip_before_action :set_current_locale

  def redirect_to_dashbord
    if current_user.visitor?
      redirect_to "/"
    else
      redirect_to "/d/#/users/#{current_user.id}"
    end
  end

  def french
    session[:locale] = :fr
    LocaleOp.switch_to_french(@current_user)
    redirect_to_dashbord
  end

  def english
    session[:locale] = :en
    LocaleOp.switch_to_english(@current_user)
    redirect_to_dashbord
  end
end
