module Localizable

  extend ActiveSupport::Concern

  included do
    before_filter :set_current_locale
  end

  def set_current_locale
    I18n.locale =
      if signed_in?
        @current_user.locale || session[:locale]
      else
        session[:locale] || @current_user.locale
      end
  end
end
