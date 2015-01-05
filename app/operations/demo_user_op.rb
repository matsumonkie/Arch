class DemoUserOp < Operation

  def update(params)
    DemoUser.find(params[:id]).tap do |user|
      type = params[:type]
      new_user = User.find_by(email: "#{type}@#{type}.#{type}")
      user.update(user: new_user)
    end
  end
end
