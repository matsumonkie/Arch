class UserOp < Operation

  def index params
    User.all
  end

  def update_email params
    user = User.find(params[:user_id])
    Form(UserForm, user, params).bind -> (form) {
      form.model.save
      form
    }
  end
end
