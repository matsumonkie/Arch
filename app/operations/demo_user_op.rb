class DemoUserOp < Operation

  def update(params)
    DemoUser.find(params[:id]).tap do |user|
      type = params[:type]
      wrapped_user = User.find_by(email: "#{type}@#{type}.#{type}")
      user.update(user: wrapped_user)
    end
  end
end
