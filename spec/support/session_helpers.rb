module SessionHelpers

  def login_as(user)
    page.set_rack_session(user_id: user.id) # for features
  rescue NameError
    session[:user_id] = user.id # for controllers
  end

  def logout
    page.set_rack_session(user_id: nil)
  rescue NameError
    session[:user_id] = user.id
  end
end
