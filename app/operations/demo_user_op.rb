class DemoUserOp < Operation

  def update(params)
    DemoUser.first.tap do |user|
      role = params[:role]
      email = "#{role.first}@#{role.first}.#{role.first}"
      wrapped_user = User.find_by(email: email)
      user.update(user: wrapped_user)
    end
  end
end
