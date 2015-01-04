class UserOp < Operation

  def update(params)
    User.find(params[:id]).tap do |user|
      user.update(whitelist(params))
    end
  end

  def whitelist(params)
    params.require(:user).permit(:firstname, :lastname)
  end
end
