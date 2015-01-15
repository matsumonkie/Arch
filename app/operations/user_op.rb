class UserOp < Operation

  def index(params)
    User.all
  end

  def show(params)
    User.find(params[:id])
  end

  def edit(params)
    User.find(params[:id])
  end

  def update(params)
    UserForm.new(User.find(params[:id])).tap do |user|
      user.attributes(params)
      user.save if user.valid?
    end
  end

  def current(current_user)
    User.find(current_user.id)
  end
end
