class UserOp < Operation

  def update(params)
    User.find(params[:id]).tap do |user|
      user.update(user_params(params))
    end
  end

  def user_params(params)
    params.require(:user).permit(:firstname, :lastname)
  end
end
