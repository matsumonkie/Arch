module ApplicationHelper

  def french_session?
    session[:locale] == 'fr'
  end
end
