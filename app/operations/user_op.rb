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
    User.find(params[:id]).tap do |user|
      user.update(whitelist(params))
    end
  end

  def current(current_user)
    User.find(current_user.id)
  end

  private

  def whitelist(params)
    params.require(:user).permit(:firstname, :lastname)
  end
end
