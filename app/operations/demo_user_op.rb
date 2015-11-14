class DemoUserOp < Operation

  def update(params)
    DemoUser.first.tap do |user|
      role = params.fetch(:demo_user).fetch(:role)
      wrapped_user = User.where(_type: role).order_by(:created_at.asc).first
      user.update(user: wrapped_user)
    end
  end
end
