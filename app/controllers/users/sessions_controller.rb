class Users::SessionsController < Devise::SessionsController

  skip_before_filter :verify_authenticity_token

  def create
    user = User.find_by(email: params[:email])

    if user && user.valid_password?(params[:password])
      http = 200
      sign_in "user", user, bypass: true
    else
      http = 401
      user = Visitor.new
    end

    render json: user.to_json, status: http
  end

  def destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out('user')

    render json: Visitor.new.to_json
  end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
